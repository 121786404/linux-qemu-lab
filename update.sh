#!/bin/bash



cd linux
git checkout master
git pull
cd ..
cd u-boot
git checkout master
git pull
cd ..
cd busybox
git checkout master
git pull
cd ..