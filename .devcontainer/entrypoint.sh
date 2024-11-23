source ./codespaces_setup.sh
cd ..
echo "Running LVS"
make all_lvs
if [ $? -neq  0]; then exit 1
echo "Running SVG Generation"
make all_svg
if [ $? -neq  0]; then exit 1
echo "Success!"
exit 0