#!/bin/bash
DIR=$(cd $(dirname ${BASHSOURCE[0]}) && pwd)
if [ ! -f $DIR/yolov4.weights ];then 
    echo "Downloading Yolov4 weights"
    wget https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights -O $DIR/yolov4.weights
fi
eval "rosrun darknet_ros $@"
