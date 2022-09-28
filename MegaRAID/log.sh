#!/bin/bash
getEvent(){
        Evens_tmp=./raid.log
        seqNum_log=./seqNum.log
        seqNum_log2=./seqNum2.log
        Evens_log=`/usr/local/sbin/MegaCli -AdpEventLog -GetEvents -f $Evens_tmp -a0`
        Evens_Item=`cat raid.log|fgrep -w "seqNum:"|wc -l`
        Even_tmp2=./Even_tmplog
        Evens_Type_List="./Even_type_list2"
        cat $Evens_tmp|fgrep -w "seqNum:">$seqNum_log
          
          for (( X=1; X<=$Evens_Item; X=X+1 ))
          do
                Item_Number=$X
                seqNum_Item=`sed -n "$X","$X"p $seqNum_log`
                Even_info=`cat $Evens_tmp|fgrep -w "$seqNum_Item" -A6 > $Even_tmp2`
                Events_Code=`cat $Even_tmp2|fgrep -w "Code:"|awk -F " " {'print $2'}`
                Events_deteil=`cat $Even_tmp2|fgrep -w "Event Description:"|cut -c19-1000`
                Events_date=`cat $Even_tmp2|fgrep -w "Time:"|awk -F " " {'print $3,$4,$5,$6'}`
                Events_Type=`cat $Evens_Type_List|fgrep -w "$Events_Code"|awk -F " " {'print $2'}`
        echo " $Item_Number  $Events_date  $Events_Type   $Events_deteil "
          done
          }

case $1 in
"--gev")
    getEvent 1
 ;;
esac

