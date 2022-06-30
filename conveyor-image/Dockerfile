FROM 1c-server-dependency:latest

# Указываем рабочий каталог
WORKDIR /opt/1c-server/ 
# Копируем скрипт деплоя
ADD ./deploy.sh ./deploy.sh
# Даем права на запуск скрипта
RUN chmod +x deploy.sh
# Перемещаем рабочий каталог, так как под конец предыдущий будет удален
WORKDIR /opt
# Запускаем скрипт
ENTRYPOINT ["/opt/1c-server/deploy.sh"]