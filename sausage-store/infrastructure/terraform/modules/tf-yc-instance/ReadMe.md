# Модуль создания виртуальной машины в Yandex Cloud

Этот модуль предназначен для создания виртуальной машины (VM) в облачной инфраструктуре Yandex Cloud с использованием Terraform. Он конфигурирует ресурсы, такие как вычислительные мощности, загрузочные диски и сетевые интерфейсы, а также поддерживает дополнительные метаданные для автоматизации процессов.
---------

## Модуль зависит от следующих компонентов:

* Terraform версии >= 0.12
* Yandex Cloud Provider (yandex-cloud/yandex) версии >= 0.87.0

## Предоставляемые Ресурсы
* Виртуальная машина (VM):
Создается экземпляр виртуальной машины с указанными параметрами.
## Входные Параметры
| Имя параметра    |	Описание                             |	Тип	      |         Значение по умолчанию|
|:-----------------|:----------------------------------------|:-----------|:-----------------------------|
|name              |Имя виртуальной машины                   |string      |"chapter5-lesson2-std-037-51" |
|platform_id	   |Идентификатор платформы VM	             |string|	  |"standard-v3"                 |
|zone	           |Зона расположения	                     |string	  |"ru-central1-a"               |
|cores             |Количество ядер процессора               |number      |2                             |
|memory	           |Объем оперативной памяти (ГБ)            |number      |2                             |
|image_id          |Идентификатор образа ОС                  |string      |"fd834mcknpoei6h5ve3"         |
|disk_size	       |Размер загрузочного диска                |number	  |10                            |
|subnet_id         |Идентификатор подсети	                 |string      |"e9b72t8g01fkr4fagkrd"        |
|security_group_ids|Список идентификаторов групп безопасности|list(string)|["enp2hq3upusqa5qlc2of"]      |
|metadata_file_path|Путь к файлу с метаданными               |string	  |"./meta.yaml"                 |

## Выходные Данные
* IP Address:
Внутренний IP адрес виртуальной машины.
* External IP Address:
Внешний IP адрес виртуальной машины (если настроено NAT).
