#!/bin/bash 
# cerner_2tothe5th_2022

# This program print through the alphabet a-az each letter will be its own thread, each thread will need to acquire a lock before executin­g its code.  

LIST="a b c d e f g h i j k l m n o p q r s t u v w x y z aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az"
max_jobs=10
count=1

for i in $LIST
do
{
  flock 3 #lock file by filedescriptor
  
  echo $$ working with lock
	sleep 2 # run other tasks here1
  echo "pass: "$count" - job letter: "$i 
  	echo "--------------"
  count=$((count+1))  
  } 3<lock & 
  #count=$((count+1))
done
wait
echo "all done"
