module "yandex_cloud_instance" {
    source = "./modules/tf-yc-instance"
    
}

module "yandex_cloud_network" {
    source = "./modules/tf-yc-network"
    
} 

# Определение переменной для получения subnet_id из модуля сети
locals {
  instance_subnet_id = module.yandex_cloud_network.yandex_vpc_subnets
}

# Вывод значений для проверки
output "instance_subnet_id" {
  value = local.instance_subnet_id
}