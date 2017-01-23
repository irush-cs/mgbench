#!/bin/sh

#set -x
#exec 1>/tmp/aaa
#exec 2>&1

export PATH=${TEST_EXTENDS}/mgbench/:${PATH}
ngpu=`numgpus`

t=$1

case $t in
    strong)
        gol --repetitions=3000 --width=16384 --height=16384 --regression=false | awk ' 
BEGIN{current = 0} 
/Testing with [0-9]+ GPUs/ {current = $3} 
/GoL - MAPS: [0-9\.]+ ms/ {ms[current] = $4} 
END{print 100 * ms[1] / ('$ngpu' * ms['$ngpu'])} 
' > $LOG_FILE

        ;;
    weak)
        sgemm -n 8192 -k 8192 -m 8192 --repetitions=100 --regression=false --scaling | awk '
BEGIN{current = 0}
/Testing with [0-9]+ GPUs/ {current = $3}
/SGEMM - MAPS \(unmodified routine\): [0-9\.]+ ms/ {ms[current] = $6}
END{print 100 * ms[1] / ms['$ngpu']}
' > $LOG_FILE

        ;;
esac

exit 0;
