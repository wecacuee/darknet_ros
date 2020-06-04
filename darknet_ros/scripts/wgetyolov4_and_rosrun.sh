#!/bin/bash
WDIR=$(rospack find darknet_ros)/yolo_network_config/weights/
if [ ! -f "$WDIR/yolov4.weights" ];then 
    echo "Downloading Yolov4 weights"
    $WDIR/download_weights.sh yolov4
fi
eval "rosrun darknet_ros $@"
