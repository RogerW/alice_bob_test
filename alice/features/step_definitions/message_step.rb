# frozen_string_literal: true

def create_message(id, txt, sended_at, received_at, repeated_at, status)
  FactoryBot.create(:message,
                    id: id,
                    txt: txt,
                    sended_at: sended_at,
                    received_at: received_at,
                    repeated_at: repeated_at,
                    status: status)
end

Допустим('ранее были созданы сообщения') do |table|
  table.hashes.each do |row|
    create_message(row['id'], row['txt'], row['sended_at'], row['received_at'], row['received_at'], row['status'])
  end
end

Допустим(/^создается сообщение с текстом ([\w]+)$/) do |txt|
  visit 'messages/new'
  fill_in 'Txt', with: txt
  click_button 'Create Message'
end

То('видит ответ {string}') do |string|
  expect(page).to have_content string
end

Допустим('пользователь хочет посмотреть принятые сообщения') do
  visit 'messages/1'
end

То('видит на экране {string}') do |string|
  expect(page).to have_content string
end

Допустим('пользователь зашел на страницу отправки') do
  visit '/'
end

Допустим('нажал кнопку Старт') do
  click_button 'Start'
end

То('видит сообщение {string}') do |string|
  expect(page).to have_content string
end

Допустим('сообщения отправляются бобу') do
  visit '/'
  click_button 'Start'
end
