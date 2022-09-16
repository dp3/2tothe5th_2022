#!/bin/bash 
#cerner_2tothe5th_2022

LIST="a b c d e f g h i j k l m n o p q r s t u v w x y z aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az"

max_jobs=10

for i in $LIST
do
  sem -j $max_jobs	"sleep 2 && echo 'Hello World, job letter: $i'"  &
done
sem --wait 
wait
echo "all done"
