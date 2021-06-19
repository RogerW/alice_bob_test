# frozen_string_literal: true

def create_message(txt, from)
  FactoryBot.create(:message, txt: txt, from: from)
end

def receive_message(txt)
  visit 'messages/new'
  fill_in 'Txt', with: txt
  click_button 'Create Message'
end

Допустим('ранее было отправлено сообщение') do |table|
  table.hashes.each do |row|
    create_message(row['txt'], row['from'])
  end
end

Допустим('было отправлено сообщение с текстом qwerty') do
  receive_message('qwerty')
end

То('видит ответ {string}') do |string|
  expect(page).to have_content string
end

Допустим('пользователь хочет посмотреть все принятые сообщения') do
  visit 'messages'
end

То('видит на экране Test от {string}') do |string|
  expect(page).to have_content 'Test'
  expect(page).to have_content string
end
