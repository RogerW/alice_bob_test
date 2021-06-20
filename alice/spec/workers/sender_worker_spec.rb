require 'rails_helper'
require 'sidekiq/testing' #include in your Rspec file
Sidekiq::Testing.fake! #include in your RSpec file

RSpec.describe SenderWorker, type: :worker do
  pending "add some examples to (or delete) #{__FILE__}"
end
