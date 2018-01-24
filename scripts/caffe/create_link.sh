#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
echo $DIR

echo "delete the old link"
rm -f $DIR/libboost_system.so
rm -f $DIR/libgflags.so.2
rm -f $DIR/libcaffe.so
rm -f $DIR/libglog.so
rm -f $DIR/libglog.so.0
rm -f $DIR/libopencv_core.so
rm -f $DIR/libopencv_core.so.3.2
rm -f $DIR/libopencv_highgui.so
rm -f $DIR/libopencv_imgcodecs.so
rm -f $DIR/libopencv_imgcodecs.so.3.2
rm -f $DIR/libopencv_imgproc.so
rm -f $DIR/libopencv_imgproc.so.3.2
rm -f $DIR/libhdf5_hl.so.7
rm -f $DIR/libhdf5.so.7
rm -f $DIR/liblmdb.so.0
rm -f $DIR/libleveldb.so.1
rm -f $DIR/liblapack.so.3

echo "create the new link"
ln -s $DIR/libboost_system.so.1.54.0 $DIR/libboost_system.so
ln -s $DIR/libcaffe.so.1.0.0 $DIR/libcaffe.so
ln -s $DIR/libgflags.so.2.1.0 $DIR/libgflags.so.2
ln -s $DIR/libglog.so.0.0.0 $DIR/libglog.so
ln -s $DIR/libglog.so.0.0.0 $DIR/libglog.so.0
ln -s $DIR/libopencv_core.so.3.2.0 $DIR/libopencv_core.so
ln -s $DIR/libopencv_core.so.3.2.0 $DIR/libopencv_core.so.3.2
ln -s $DIR/libopencv_highgui.so.3.2.0 $DIR/libopencv_highgui.so
ln -s $DIR/libopencv_imgcodecs.so.3.2.0 $DIR/libopencv_imgcodecs.so
ln -s $DIR/libopencv_imgcodecs.so.3.2.0 $DIR/libopencv_imgcodecs.so.3.2
ln -s $DIR/libopencv_imgproc.so.3.2.0 $DIR/libopencv_imgproc.so
ln -s $DIR/libopencv_imgproc.so.3.2.0 $DIR/libopencv_imgproc.so.3.2
ln -s $DIR/libhdf5_hl.so.7.0.0 $DIR/libhdf5_hl.so.7
ln -s $DIR/libhdf5.so.7.0.0 $DIR/libhdf5.so.7
ln -s $DIR/liblmdb.so.0.0.0 $DIR/liblmdb.so.0
ln -s $DIR/libleveldb.so.1.15 $DIR/libleveldb.so.1
ln -s $DIR/liblapack.so.3.0 $DIR/liblapack.so.3

echo "success create the new link"
