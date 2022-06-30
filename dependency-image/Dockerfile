FROM ubuntu:20.04

# Указываем рабочий каталог и копируем конфигурационный файл раскладки
WORKDIR /opt/1c-server/
ADD ./selections.conf ./selections.conf
# Устанавливаем первый пакет зависимостей
RUN apt-get update && apt-get install -yq tzdata debconf-utils curl fontconfig unixodbc ttf-mscorefonts-installer libgsf-1-114
# Настраиваем временную зону и раскладку клавиатуры (иначе повиснем на процессе установки)
RUN ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && debconf-set-selections < selections.conf
RUN dpkg-reconfigure -f noninteractive tzdata keyboard-configuration
# Устанавливаем оставшиеся зависимости
RUN apt-get install -yq geoclue-2.0 gstreamer1.0-plugins-bad
# Правим локаль на русскую
RUN export LANG=ru_RU.UTF-8