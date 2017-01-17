#!/bin/bash

[ -d mgbench ] && rm -r mgbench
tar xvf mgbench.tar.gz
dir=`tar tvf mgbench.tar.gz | head -n 1 | awk '{print $NF}'`
mv "$dir" mgbench
cd mgbench
cmake .
make -j $NUM_CPU_JOBS
echo $? > ~/install-exit-status
cd ..

cat > mgbench-base <<'EOF'
#!/bin/sh

PATH=`pwd`/mgbench/:${PATH}
mgbench/numgpus > $LOG_FILE

EOF

chmod +x mgbench-base
