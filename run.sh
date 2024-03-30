#!/usr/bin/bash
WORKSPACE=`pwd`
ADDRESS=$([[ -z $ADDRESS ]] && echo "0.0.0.0" || echo $ADDRESS )
PORT=$([[ -z $PORT ]] && echo "9977" || echo $PORT )
DEV_TYPE=$([[ -z $DEV_TYPE ]] && echo "cpu" || echo $DEV_TYPE )
VAD=$([[ -z $VAD ]] && echo "true" || echo $VAD )
TEMPERATURE=$([[ -z $TEMPERATURE ]] && echo "0" || echo $TEMPERATURE )
CUDA_COM_TYPE=$([[ -z $CUDA_COM_TYPE ]] && echo "int8" || echo $CUDA_COM_TYPE )
CONDITION_ON_PREVIOUS_TEXT=$([[ -z $CONDITION_ON_PREVIOUS_TEXT ]] && echo "false" || echo $CONDITION_ON_PREVIOUS_TEXT )
source $WORKSPACE/venv/bin/activate
sed -i "s/^\(web_address=\).*/\1$ADDRESS:$PORT/g"  $WORKSPACE/set.ini
sed -i "s/^\(devtype=\).*/\1$DEV_TYPE/g"  $WORKSPACE/set.ini
sed -i "s/^\(vad=\).*/\1$VAD/g"  $WORKSPACE/set.ini
sed -i "s/^\(temperature=\).*/\1$TEMPERATURE/g"  $WORKSPACE/set.ini
sed -i "s/^\(cuda_com_type=\).*/\1$CUDA_COM_TYPE/g"  $WORKSPACE/set.ini
sed -i "s/^\(condition_on_previous_text=\).*/\1$CONDITION_ON_PREVIOUS_TEXT/g"  $WORKSPACE/set.ini
cat $WORKSPACE/set.ini
python start.py