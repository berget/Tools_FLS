#!/bin/bash


FILE_LIST="./list.log"

[ ! -f $FILE_LIST ] && echo "No search $FILE_LIST" && exit 2


for File in $(cat $FILE_LIST)
do
  if [ -a $File ];then
    echo "OK is $File" >> ./tmp.log
  else
    echo "$File" >> ./tmp.log
  fi
done
