#!/bin/bash

cd ~/AndroidStudioProjects/pharmaplay/
for ii in `find . -name pubspec.yaml |  sed "s/pubspec.yaml//"` 
do
echo $ii
cd ~/AndroidStudioProjects/pharmaplay/
cd $ii
 flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
done
