#!/bin/sh -l
#export PATH="$PATH:/tools/magic/bin"
#export PATH="$PATH:/tools/netgen/bin"
#export PATH="$PATH:/tools/ngspice/bin"
#export PATH="$PATH:/tools/xschem/bin"
#export PDK_ROOT="/tools/open_pdks/share/pdk"
#echo "PDK_ROOT=$PDK_ROOT"
echo "PATH=$PATH"
$(pwd)
cd ..
make all_lvs
if [ $? -neq  0]; then exit 1 fi
make all_svg
if [ $? -neq  0]; then exit 1 fi
exit 0
