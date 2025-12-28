# Activate conda in the shell
eval "$(conda shell.bash hook)"

# Create and activate the new conda environment
conda activate trellis2

# Set the HF model cache directory
export HF_HOME="models"

# Work-around for PTXAS bug
export TRITON_PTXAS_PATH="$(which ptxas)"

# Log in to HuggingFace if required to download the models
DIR="$PWD/models/hub"
ls "$DIR/models--briaai--RMBG-2.0" \
   "$DIR/models--facebook--dinov3-vitl16-pretrain-lvd1689m" \
   >/dev/null 2>&1 || \
   hf auth login

# Start the application
python3 app.py