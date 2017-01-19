#!/bin/bash

#set -x
#exec 1>/tmp/aaa
#exec 2>&1

export PATH=${TEST_EXTENDS}/mgbench/:${PATH}

if [ -z "$CUDA_VISIBLE_DEVICES" ]; then
    CUDA_VISIBLE_DEVICES=`seq -s , 1 \`numgpu\``
fi

export CUDA_VISIBLE_DEVICES

t=$1
pids=""
per=""
case $t in
    single)
        awk1="SGEMM"
    ;;
    double)
        per=--double
        awk1="DGEMM"
    ;;
    fixed)
        cmd="gol --repetitions=1000 --width=16384 --height=16384 --regression=false --num_gpus=1 | awk '\$1==\"GoL\"{print \$4}'"
        ;;
esac

if [ "$1" != fixed ]; then
    cmd="sgemm -n 8192 -k 8192 -m 8192 --repetitions=100 --regression=false $per --num_gpus=1 | awk '\$1==\"$awk1\"{print \$6}'"
fi

for d in `echo $CUDA_VISIBLE_DEVICES | tr ',' ' '`; do
    eval env CUDA_VISIBLE_DEVICES=$d $cmd > $t.$d &
    pids+=" $!"
done
for pid in $pids; do
    wait $pid
done
i=0
s=0
for d in `echo $CUDA_VISIBLE_DEVICES | tr ',' ' '`; do
    i=$((i + 1))
    ms=`cat $t.$d`
    s="$s + $ms"
done
echo "($s) / $i" | bc -l > $LOG_FILE
