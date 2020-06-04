#!/bin/bash
# cd catkin_workspace/src/darknet_ros/darknet_ros/yolo_network_config/weights/
DIR=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

wgetweight() {
    if [ ! -f "$DIR/$weightname.weights" ]; then
        wget https://pjreddie.com/media/files/$weightname.weights -O "$DIR/$weightname.weights"
    fi
}

weightname=${1:yolov4}

# COCO data set (Yolo v2):
if [[ "$weightname" == "yolov2" || "$weightname" == "yolov2-tiny" ]]; then
    wgetweight $weightname
# VOC data set (Yolo v2):
elif [[ "$weightname" == "yolov2-voc" || "$weightname" == "yolov2-tiny-voc" ]]; then
    wgetweight $weightname

# Yolo v3:
elif [[ "$weightname" == "yolov3" || "$weightname" == "yolov3-voc" ]]; then
    wgetweight $weightname

# Yolo v4:
elif [ "$weightname" == "yolov4" ];then
  # https://drive.google.com/open?id=1cewMfusmPjYWbrnuJRuKhPMwRe_b9PaT
  if [ ! -f "$DIR/$weightname.weights" ]; then
      wget https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights -O "$DIR/$weightname.weights"
  fi
else
  echo "Do not know weight $weightname";
  exit 1;
fi
