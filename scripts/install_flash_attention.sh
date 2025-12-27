echo "Installing FlashAttention..."
pip3 install psutil
mkdir -p /tmp/extensions
git clone https://github.com/Dao-AILab/flash-attention.git /tmp/extensions/flash-attn
MAX_JOBS=4 pip3 install /tmp/extensions/flash-attn --no-build-isolation