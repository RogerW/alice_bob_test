# frozen_string_literal: true

class MessageGenerator
  def gen_string
    length = rand(10...56)
    (0...length).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
