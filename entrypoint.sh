#!/bin/bash
if [ ! -d "/data/comfyui/models" ]; then
    echo "Installing..."
    git clone https://github.com/ai-dock/comfyui.git /data/comfyui
    cd /data/comfyui
    #cp settings-no-refiner.json settings.json
    git reset --hard
    python3 -m venv .venv
    source .venv/bin/activate
    pip install packaging==23.1 pygit2==1.12.2
fi
cd /data/comfyui
source .venv/bin/activate
echo "Launching..."
python entry_with_update.py --listen 0.0.0.0 --port 8080 --theme dark


pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu126

