FROM ubuntu:20.04

# Указываем рабочий каталог
WORKDIR /opt/1c-server/ 
# Копируем скрипт деплоя и конфигурационный файл раскладки
ADD ./deploy.sh ./deploy.sh
ADD ./selections.conf ./selections.conf
# Даем права на запуск скрипта
RUN chmod +x deploy.sh
# Перемещаем рабочий каталог, так как под конец предыдущий будет удален
WORKDIR /opt
# Запускаем скрипт
ENTRYPOINT ["./1c-server/deploy.sh"]