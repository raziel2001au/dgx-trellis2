echo "Installing o-voxel..."
mkdir -p /tmp/extensions
if [ -d "../o-voxel" ] ; then
    cd ..
fi
cp -r o-voxel /tmp/extensions/o-voxel
pip3 install /tmp/extensions/o-voxel --no-build-isolation