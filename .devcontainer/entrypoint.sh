#!/bin/sh -l
#export PATH="$PATH:/tools/magic/bin"
#export PATH="$PATH:/tools/netgen/bin"
#export PATH="$PATH:/tools/ngspice/bin"
#export PATH="$PATH:/tools/xschem/bin"
#export PDK_ROOT="/tools/open_pdks/share/pdk"
#echo "PDK_ROOT=$PDK_ROOT"
echo "PATH=$PATH"
curr=$(pwd)
echo "$curr"
cd ..
echo "Running LVS" >> "$GITHUB_OUTPUT"
make all_lvs
if [ $? -neq  0]; then exit 1 fi
echo "Running SVG Generation" >> "$GITHUB_OUTPUT"
make all_svg
if [ $? -neq  0]; then exit 1 fi
echo "Success" >> "$GITHUB_OUTPUT"
exit 0