#!/bin/bash
# Переменные скрипта
source config.env
url_base="https://storage.yandexcloud.net/antonov-distrib/server64_"
url_version=$(tr '.' '_' <<< ${ONEC_VERSION})
url="$url_base$url_version.tar.gz"
archive_name=${ONEC_VERSION}.tar.gz
script_name=setup-full-${ONEC_VERSION}-x86_64.run
# Скачиваем и распаковываем архив
curl -L $url -o $archive_name
tar xzf $archive_name --one-top-level
# Запускаем установку
chmod +x ./${ONEC_VERSION}/$script_name
echo "Начало установки 1С"
./${ONEC_VERSION}/$script_name --mode unattended --enable-components server,ws,server_admin,liberica_jre,ru
echo "Конец установки 1С"
# Чистим лишнее
cd /opt/1cv8
rm -rf /opt/1c-server/
apt-get autoclean
apt-get clean
apt-get autoremove