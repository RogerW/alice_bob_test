# language: ru
Функционал: Необходимо принимать сообщения от Алисы

Предыстория: 
Допустим ранее было отправлено сообщение
| txt  | from      |
| Test | '1.1.1.1' |


Сценарий: Прием сообщения.
Допустим было отправлено сообщение с текстом qwerty
То видит ответ 'Message was successfully created.'

Сценарий: Просмотр ранее принятых сообщений
Допустим пользователь хочет посмотреть все принятые сообщения
То видит на экране Test от '1.1.1.1'
