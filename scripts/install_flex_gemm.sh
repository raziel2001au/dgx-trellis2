echo "Installing FlexGEMM..."
mkdir -p /tmp/extensions
git clone https://github.com/JeffreyXiang/FlexGEMM.git /tmp/extensions/FlexGEMM --recursive
pip3 install /tmp/extensions/FlexGEMM --no-build-isolation