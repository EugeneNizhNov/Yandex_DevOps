resource "yandex_compute_instance" "vm-1" {
    name        = var.name
    platform_id = var.platform_id
    zone        = var.zone
    scheduling_policy {
        preemptible = true
    }

    # Конфигурация ресурсов:
    # количество процессоров и оперативной памяти
    resources {
        cores  = var.cores
        memory = var.memory
    }

    # Загрузочный диск:
    # здесь указывается образ операционной системы
    # для новой виртуальной машины
    boot_disk {
        initialize_params {
            image_id  = var.image_id
            #image_id = "fd84f596tp5sv9tjvmc0"
            size      = var.disk_size
        }
    }

    # Сетевой интерфейс:
    # нужно указать идентификатор подсети, к которой будет подключена ВМ
    network_interface {
        subnet_id          = var.subnet_id
        nat                = true
        security_group_ids = [var.security_group_ids]
    }

    # Метаданные машины:
    # здесь можно указать скрипт, который запустится при создании ВМ
    # или список SSH-ключей для доступа на ВМ
    metadata = {
        user-data = "${file(var.metadata_file_path)}"
        #ssh-keys = "eugene:${file("~/.ssh/id_rsa.pub")}"
    }
}