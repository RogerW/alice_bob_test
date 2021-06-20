# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/show', type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
                                  txt: 'Txt',
                                  status: 2
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Txt/)
    expect(rendered).to match(/2/)
  end
end
