# README

Система передачи сообщений, состоит из двух компонентов - Alice отпраляет сообщения и Bob принимает. Все компоненты в Docker. Для запуска:

* docker-compose up --build

* docker-compose exec bob rake db:migdrate 

* docker-compose exec alice rake db:migdrate

* docker-compose run bob_test rake db:migdrate 

* docker-compose run alice_test rake db:migdrate

Тесты **Cucumber**

* docker-compose run bob_test cucumber

* docker-compose run alice_test cucumber
