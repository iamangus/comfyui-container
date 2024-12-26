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
    pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu126
    pwd
    ls -ltrah
    pip install -r requirements.txt
fi
cd /data/comfyui
source .venv/bin/activate
echo "Launching..."
python main.py --listen 0.0.0.0 --port 8188