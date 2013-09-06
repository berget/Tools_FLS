#!/bin/bash


FILE_LIST="./list.log"

# file Checker

Checker="/usr/bin/md5sum"


# set date time
DATE=$(date +%y%m%d_%H%M)

MD5_LOG="md5.${DATE}"
#確認使用有沒有FILE LIST
[ ! -f $FILE_LIST ] && echo "No search $FILE_LIST" && exit 2



mk_Fmd5(){
  
  local x="$1"
  $Checker $x
#  for x in $(cat $FILE_LIST)
#  do
    
#  done
}

on_CH_Fmd5(){
  local oc5="$1"

#  for Xoc5 in $(cat $oc5)
#  do
    $Checker -c $oc5
#  done
}

CHECK_FILE(){

  for File in $(cat $FILE_LIST)
  do
    if [ -a $File ];then
      $Checker "$File"  >> ./$MD5_LOG
    else
      echo "$File" >> ./$MD5_LOG
    fi
  done
}

#====main=====



echo "1)指紋建構 2)確認檔案"
read cc;

case $cc in
  1)
    CHECK_FILE
  ;;
  2)
    [ -z $1 ] && echo "No search $1" && exit 2
    on_CH_Fmd5 $1
  ;;
  *)
     echo "結束程式";
  ;;
esac
