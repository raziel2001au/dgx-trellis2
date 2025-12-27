echo "Installing CuMesh..."
mkdir -p /tmp/extensions
git clone https://github.com/JeffreyXiang/CuMesh.git /tmp/extensions/CuMesh --recursive
pip3 install /tmp/extensions/CuMesh --no-build-isolation