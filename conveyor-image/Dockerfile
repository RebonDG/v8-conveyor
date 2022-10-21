FROM 1c-server-dependency:latest

# Указываем рабочий каталог
WORKDIR /opt/1c-server/ 
# Копируем скрипт деплоя
ADD ./deploy.sh ./deploy.sh
ADD ./config.env ./config.env
# Даем права на запуск скрипта
RUN chmod +x deploy.sh
# Запускаем скрипт
# ENTRYPOINT ["/opt/1c-server/deploy.sh"]
RUN ./deploy.sh
# Перемещаем рабочий каталог на каталог с 1С, так как под конец предыдущий будет удален
WORKDIR /opt/1cv8