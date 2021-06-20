# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/index', type: :view do
  before(:each) do
    assign(:messages, [
             Message.create!(
               txt: 'Txt',
               status: 2
             ),
             Message.create!(
               txt: 'Txt',
               status: 2
             )
           ])
  end

  it 'renders a list of messages' do
    render
    assert_select 'tr>td', text: 'Txt'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
