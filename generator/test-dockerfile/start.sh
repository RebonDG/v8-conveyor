#!/bin/bash
/opt/1cv8/x86_64/8.3.21.1302/ras cluster --port=${RAS_PORT} $RAS_CLUSTER_ADDRESS &
/opt/1cv8/x86_64/8.3.21.1302/ragent \
                        -d ${SRV1CV8_DATA} \
                        -port ${SRV1CV8_PORT} \
                        -regport ${SRV1CV8_REGPORT} \
                        -range ${SRV1CV8_RANGE} \
                        -seclev ${SRV1CV8_SECLEV} \
                        -pingPeriod ${SRV1CV8_PINGPERIOD} \
                        -pingTimeout ${SRV1CV8_PINGTIMEOUT} \
                        $SRV1CV8_DEBUG