data "yandex_vpc_network" "default" {
    name = "default"
}

data "yandex_vpc_subnet" "default" {
    for_each = toset(var.network_zone)
    name = "${data.yandex_vpc_network.default.name}-${each.key}" 
} 

