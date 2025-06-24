## Terraform Module для работы с Yandex Cloud VPC

Этот модуль позволяет получить данные о виртуальной сети (VPC) и подсетях в Yandex Cloud. Модуль использует провайдера yandex для взаимодействия с API Yandex Cloud.

## Модуль зависит от следующих компонентов:

* Terraform версии >= 0.12
* Yandex Cloud Provider (yandex-cloud/yandex) версии >= 0.87.0


## Входные переменные
network_zone
Описание: Зоны доступности сетей в Yandex Cloud.
Тип: set(string)
Дефолтное значение: ["ru-central1-a", "ru-central1-b", "ru-central1-d"]

## Выходные значения
yandex_vpc_subnets
Описание: Карта подсетей Yandex Cloud.
Значение: Карта с подсетями, полученными через data.yandex_vpc_subnet.