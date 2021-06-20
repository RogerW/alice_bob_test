# language: ru
Функционал: Необходимо хранить лог сообщений для Боба

Предыстория:
Допустим ранее были созданы сообщения
|id| txt  | sended_at             | received_at          | repeated_at | status |
| 1| Test | '2001-01-01 10:00:00' | '2001-01-01 11:00:00'|             | sended |


Структура сценария: создание сообщения.
Допустим создается сообщение с текстом <txt>
То видит ответ 'Message was successfully created.'
Примеры:
| txt                 |
| njahjhsdjhagdjhasdg |
| jasjhdgashdgajsdgjdg|
| jhsakjdhaskjakjkjj  | 


Сценарий: Просмотр ранее созданных сообщений
Допустим пользователь хочет посмотреть принятые сообщения 
То видит на экране 'Test'