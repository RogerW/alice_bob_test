# frozen_string_literal: true

class Message < ApplicationRecord
  validates :txt, presence: true
end
