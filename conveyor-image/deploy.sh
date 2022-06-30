#!/bin/bash
# Переменные скрипта
url_base="https://storage.yandexcloud.net/antonov-distrib/server64_"
url_version=$(tr '.' '_' <<< ${ONEC_VERSION})
url="$url_base$url_version.tar.gz"
archive_name=${ONEC_VERSION}.tar.gz
script_name=setup-full-${ONEC_VERSION}-x86_64.run
# Устанавливаем зависимости
cd /opt/1c-server/
apt update
apt-get install -yq tzdata debconf-utils curl fontconfig unixodbc ttf-mscorefonts-installer libgsf-1-114
# Настраиваем временную зону и раскладку клавиатуры (иначе повиснем на процессе установки)
ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime
debconf-set-selections < selections.conf
dpkg-reconfigure -f noninteractive tzdata
dpkg-reconfigure  -f noninteractive keyboard-configuration
# Устанавливаем зависимости 1С
apt-get install -yq geoclue-2.0 gstreamer1.0-plugins-bad
# Правим локаль на русскую
export LANG=ru_RU.UTF-8
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
apt autoclean
apt clean
apt autoremove