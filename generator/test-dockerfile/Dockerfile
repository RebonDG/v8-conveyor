FROM 1c-server-conveyor:8.3.21.1302

# Определение переменных окружения
ENV RAS_PORT=1545
ENV RAS_CLUSTER_ADDRESS=''
ENV SRV1CV8_KEYTAB=/opt/1cv8/x86_64/8.3.21.1302/usr1cv8.keytab
ENV SRV1CV8_PORT=1540
ENV SRV1CV8_RANGE='1560:1591'
ENV SRV1CV8_DEBUG=-debug
ENV SRV1CV8_DATA=/home/usr1cv8/.1cv8/1C/1cv8
ENV SRV1CV8_SECLEV=0
ENV SRV1CV8_PINGPERIOD=1000
ENV SRV1CV8_PINGTIMEOUT=5000

WORKDIR /opt/1cv8
ADD ./start.sh ./docker-start.sh
RUN chmod +x ./docker-start.sh
ENTRYPOINT [ "./docker-start.sh" ]