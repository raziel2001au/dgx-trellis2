# Activate conda in the shell
eval "$(conda shell.bash hook)"

# Create and activate the new conda environment
conda activate trellis2

# Work-around for PTXAS bug
export TRITON_PTXAS_PATH="$(which ptxas)"

# Start the application
python3 app.py