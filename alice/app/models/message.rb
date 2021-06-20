# frozen_string_literal: true

class Message < ApplicationRecord
  enum status: %i[created sended recieved need_repeat repeated failed]
  after_initialize :set_default_status, if: :new_record?

  before_update :log_time, if: :status_changed?

  private

  def set_default_status
    self.status ||= :created
  end

  def log_time
    case status
    when 'sended'
      self.sended_at = Time.now
    when 'recieved'
      self.received_at = Time.now
    when 'repeated'
      self.repeated_at = Time.now
    end
  end
end
