# Read Arguments
TEMP=`getopt -o h --long help,new-env,basic,flash-attn,cumesh,o-voxel,flexgemm,nvdiffrast,nvdiffrec -n 'setup.sh' -- "$@"`

eval set -- "$TEMP"

HELP=false
NEW_ENV=false
BASIC=false
FLASHATTN=false
CUMESH=false
OVOXEL=false
FLEXGEMM=false
NVDIFFRAST=false
NVDIFFREC=false
ERROR=false


if [ "$#" -eq 1 ] ; then
    HELP=true
fi

while true ; do
    case "$1" in
        -h|--help) HELP=true ; shift ;;
        --new-env) NEW_ENV=true ; shift ;;
        --basic) BASIC=true ; shift ;;
        --flash-attn) FLASHATTN=true ; shift ;;
        --cumesh) CUMESH=true ; shift ;;
        --o-voxel) OVOXEL=true ; shift ;;
        --flexgemm) FLEXGEMM=true ; shift ;;
        --nvdiffrast) NVDIFFRAST=true ; shift ;;
        --nvdiffrec) NVDIFFREC=true ; shift ;;
        --) shift ; break ;;
        *) ERROR=true ; break ;;
    esac
done

if [ "$ERROR" = true ] ; then
    echo "Error: Invalid argument"
    HELP=true
fi

if [ "$HELP" = true ] ; then
    echo "Usage: setup.sh [OPTIONS]"
    echo "Options:"
    echo "  -h, --help              Display this help message"
    echo "  --new-env               Create new conda environment and install PyTorch"
    echo "  --basic                 Install basic dependencies"
    echo "  --flash-attn            Install flash-attention (this takes a long time)"
    echo "  --cumesh                Install cumesh"
    echo "  --o-voxel               Install o-voxel"
    echo "  --flexgemm              Install flexgemm"
    echo "  --nvdiffrast            Install nvdiffrast"
    echo "  --nvdiffrec             Install nvdiffrec"
    echo
    echo "To install everything: ./setup.sh --new-env --basic --flash-attn --nvdiffrast --nvdiffrec --cumesh --o-voxel --flexgemm"
    exit 0
fi

# Get system information
WORKDIR=$(pwd)
if command -v nvidia-smi > /dev/null; then
    PLATFORM="cuda"
else
    echo "Error: No supported GPU found"
    exit 1
fi

# Install system dependencies
echo "We need to install libjpeg-dev via apt. You will likely be prompted for your password."
sudo apt install -y libjpeg-dev

if [ "$NEW_ENV" = true ] ; then
    # Check that conda is installed
    command -v conda >/dev/null 2>&1 || {
        echo "Error: conda is not installed or not on PATH" >&2
        exit 1
    }

    # Activate conda in the shell
    eval "$(conda shell.bash hook)"

    # Create and activate the new conda environment
    conda create -n trellis2 python=3.13 && conda activate trellis2
    source scripts/install_torch.sh
fi

if [ "$BASIC" = true ] ; then
    source scripts/install_basic_dependencies.sh
fi

if [ "$FLASHATTN" = true ] ; then
    source scripts/install_flash_attention.sh
fi

if [ "$NVDIFFRAST" = true ] ; then
    source scripts/install_nvdiffrast.sh
fi

if [ "$NVDIFFREC" = true ] ; then
    source scripts/install_nvdiffrec.sh
fi

if [ "$CUMESH" = true ] ; then
    source scripts/install_cumesh.sh
fi

if [ "$FLEXGEMM" = true ] ; then
    source scripts/install_flex_gemm.sh
fi

if [ "$OVOXEL" = true ] ; then
    source scripts/install_o_voxel.sh
fi
