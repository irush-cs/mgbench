#!/bin/bash

set -x
exec 1>/tmp/aaa
exec 2>&1

PATH=$TEST_EXTENDS/mgbench/:${PATH}
printenv 

# find some gpus
numgpus && echo -n PASS > $LOG_FILE || echo -n FAIL > $LOG_FILE
ngpu=`numgpus`

# basic validation
pids=""
for g in `seq 0 \`expr $ngpu - 1\` `; do
    msize=16384
            
    gol --width $msize --height $msize --num_gpus=1 --repetitions=5 --regression=true --gpuoffset=$g &
    pids+=" $!"
done
exists=0
for pid in $pids; do
    wait $pid
    exists=$((exists + $?))
done
[ $exists = 0 -a -n "$pids" ] && echo -n ,PASS >> $LOG_FILE || echo -n ,FAIL >> $LOG_FILE

# basic validation for host to device
msize=1024
sgemm -n $msize -k $msize -m $msize --repetitions=100 --regression=true --startwith=$ngpu
[ $? = 0 ] && echo -n ,PASS >> $LOG_FILE || echo -n ,FAIL >> $LOG_FILE

# basic validation for device to device
msize=16384
gol --width $msize --height $msize --repetitions=5 --regression=true --startwith=$ngpu
[ $? = 0 ] && echo -n ,PASS >> $LOG_FILE || echo -n ,FAIL >> $LOG_FILE

# files should end with new-line
echo >> $LOG_FILE
