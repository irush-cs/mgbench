#!/bin/bash

set -e

tar xvf mgbench-1.0.tar.gz
cd mgbench-1.0
cmake .
make -j $NUM_CPU_JOBS
cd ..

cat > mgbench-base <<'EOF'
#!/bin/sh

PATH=`pwd`/mgbench-1.0/:${PATH}
mgbench-1.0/numgpus > $LOG_FILE

EOF

chmod +x mgbench-base
