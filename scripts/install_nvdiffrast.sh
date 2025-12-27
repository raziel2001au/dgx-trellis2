echo "Installing nvdiffrast..."
mkdir -p /tmp/extensions
git clone -b v0.4.0 https://github.com/NVlabs/nvdiffrast.git /tmp/extensions/nvdiffrast
pip3 install /tmp/extensions/nvdiffrast --no-build-isolation