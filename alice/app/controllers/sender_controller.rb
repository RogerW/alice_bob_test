# frozen_string_literal: true

require 'message_generator'

class SenderController < ApplicationController
  def index
    ss = Sidekiq::ScheduledSet.new
    @stats = ss.scan('SenderWorker').map(&:at)
  end

  def create
    interval = params['interval'].blank? ? rand(1...10) : params['interval'].to_i
    maxcount = params['maxcount'].blank? ? -1 : params['maxcount'].to_i

    mg = MessageGenerator.new
    message = Message.new(txt: mg.gen_string)

    respond_to do |format|
      if message.save
        SenderWorker.perform_in(interval.seconds, message.id, params['interval'].to_i, maxcount)
        format.html { redirect_to sender_index_path, notice: 'Job started successfully.' }
        format.json { render :index, status: :created }
      else
        format.html { render sender_index_path, notice: 'error' }
        format.json { render json: job.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    ss = Sidekiq::ScheduledSet.new
    ss.scan('SenderWorker').map(&:kill)

    respond_to do |format|
      if ss.scan('SenderWorker').any?
        format.html { render sender_index_path, notice: 'error' }
        format.json { render json: job.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to sender_index_path, notice: 'Job stopped successfully.' }
        format.json { render :index, status: :created }
      end
    end
  end
end
