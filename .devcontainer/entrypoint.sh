#!/bin/sh -l
source ../scripts/codespaces_setup.sh
cd ..
echo "Running LVS" >> $GITHUB_OUTPUT 
make all_lvs
if [ $? -neq  0]; then exit 1
echo "Running SVG Generation" >> $GITHUB_OUTPUT
make all_svg
if [ $? -neq  0]; then exit 1
echo "Success!" >> $GITHUB_OUTPUT
exit 0