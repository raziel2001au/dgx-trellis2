echo "Installing nvdiffrec..."
mkdir -p /tmp/extensions
git clone -b renderutils https://github.com/JeffreyXiang/nvdiffrec.git /tmp/extensions/nvdiffrec
pip3 install /tmp/extensions/nvdiffrec --no-build-isolation