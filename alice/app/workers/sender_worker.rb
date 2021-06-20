# frozen_string_literal: true

require 'faraday'
require 'message_generator'

class SenderWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(message_id, interval, maxcount)
    puts "Woker Message ID #{message_id}, Interval #{interval} Maxcount #{maxcount}"

    message = Message.find(message_id)

    case message.status
    when 'created'
      message.sended!
      create_message(interval, maxcount)

      if send_message(message.txt).status == 201
        message.recieved!
      else
        message.need_repeat!
        SenderWorker.perform_at(15.seconds, message.id, 0, -1)
      end
    when 'need_repeat'
      message.repeated!

      if send_message(message.txt).status == 201
        message.recieved!
      else
        message.failed!
      end
    end
  end

  private

  def send_message(txt)
    url = ENV['BOB_URI']

    Faraday.post(url, message: { txt: txt })
  end

  def create_message(interval, maxcount)
    next_send = interval.zero? ? rand(1...10) : interval
    mg = MessageGenerator.new

    if (maxcount == -1) || (maxcount > 1)
      SenderWorker.perform_at(
        next_send.seconds,
        Message.create(txt: mg.gen_string).id,
        interval,
        maxcount == -1 ? -1 : maxcount - 1
      )
    end
    nil
  end
end
