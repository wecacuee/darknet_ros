#!/bin/bash
DIR=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
if [ ! -f $DIR/yolov4.weights ];then 
    echo "Downloading Yolov4 weights"
    $DIR/download_weights.sh yolov4
fi
eval "rosrun darknet_ros $@"
