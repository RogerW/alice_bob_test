# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    txt { 'MyString' }
    sended_at { '2021-06-19 12:10:40' }
    received_at { '2021-06-19 12:10:40' }
    repeated_at { '2021-06-19 12:10:40' }
    status { 1 }
  end
end
