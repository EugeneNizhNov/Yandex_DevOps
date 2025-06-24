#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf frontend.service /etc/systemd/system/frontend.service
sudo rm -f /opt/sausage-store/static/dist/frontend/*||true
#Переносим артефакт в нужную папку
sudo curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o ~/sausage-store-${VERSION}.tar.gz ${NEXUS_REPO_URL}/repository/${NEXUS_REPO_FRONTEND_NAME}/${VERSION}/sausage-store-${VERSION}.tar.gz
tar -xvf sausage-store-${VERSION}.tar.gz
rm -f ~/sausage-store-${VERSION}.tar.gz||true
sudo cp -r ~/frontend/. /opt/sausage-store/static/dist/frontend/
#Обновляем конфиг systemd с помощью рестарта
sudo systemctl daemon-reload
#Перезапускаем сервис сосисочной
sudo systemctl restart frontend.service 