#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf backend.service /etc/systemd/system/backend.service
sudo rm -f /opt/sausage-store/bin/sausage-store-backend.jar||true
#Переносим артефакт в нужную папку
sudo curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o /opt/sausage-store/bin/sausage-store-backend.jar ${NEXUS_REPO_URL}/repository/${NEXUS_REPO_BACKEND_NAME}/com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar
#sudo cp ./sausage-store-backend.jar /opt/sausage-store/bin/sausage-store.jar||true #"<...>||true" говорит, если команда обвалится — продолжай
#Обновляем конфиг systemd с помощью рестарта
sudo systemctl daemon-reload
#Перезапускаем сервис сосисочной
sudo systemctl restart backend.service 