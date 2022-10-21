#!/bin/bash
echo "Запуск RAS первый раз"
/opt/1cv8/x86_64/8.3.21.1302/ras cluster --port=${RAS_PORT} $RAS_CLUSTER_ADDRESS &
echo "Запуск 1С первый раз"
/opt/1cv8/x86_64/8.3.21.1302/ragent \
                        -d ${SRV1CV8_DATA} \
                        -port ${SRV1CV8_PORT} \
                        -regport ${SRV1CV8_REGPORT} \
                        -range ${SRV1CV8_RANGE} \
                        -seclev ${SRV1CV8_SECLEV} \
                        -pingPeriod ${SRV1CV8_PINGPERIOD} \
                        -pingTimeout ${SRV1CV8_PINGTIMEOUT} \
                        $SRV1CV8_DEBUG &
echo $HOSTNAME
sleep 5s
cd /home/usr1cv8
find . -type f -print0 | xargs -0 sed -i "s/${HOSTNAME}/${SRV_URI}/g"
pkill rmngr
pkill ras
pkill rphost
pkill ragent
echo "Запуск RAS"
/opt/1cv8/x86_64/8.3.21.1302/ras cluster --port=${RAS_PORT} $RAS_CLUSTER_ADDRESS &
echo "Запуск 1С"
/opt/1cv8/x86_64/8.3.21.1302/ragent \
                        -d ${SRV1CV8_DATA} \
                        -port ${SRV1CV8_PORT} \
                        -regport ${SRV1CV8_REGPORT} \
                        -range ${SRV1CV8_RANGE} \
                        -seclev ${SRV1CV8_SECLEV} \
                        -pingPeriod ${SRV1CV8_PINGPERIOD} \
                        -pingTimeout ${SRV1CV8_PINGTIMEOUT} \
                        $SRV1CV8_DEBUG