#!/bin/bash

ROOT_DIR="$( cd "$(dirname "$0")" ; cd ../../ ; pwd -P )"
echo $ROOT_DIR

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROOT_DIR/lib/caffe
echo $LD_LIBRARY_PATH

sudo chmod a+x $ROOT_DIR/scripts/caffe/create_link.sh
bash $ROOT_DIR/scripts/caffe/create_link.sh


sudo chmod a+x $ROOT_DIR/bin/classification

$ROOT_DIR/bin/classification \
$ROOT_DIR/resource/caffenet/deploy.prototxt \
$ROOT_DIR/resource/caffenet/bvlc_reference_caffenet.caffemodel \
$ROOT_DIR/resource/caffenet/imagenet_mean.binaryproto \
$ROOT_DIR/resource/caffenet/synset_words.txt \
$ROOT_DIR/resource/caffenet/cat.jpeg
