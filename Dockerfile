# Use the official z-image-turbo base — already has all four files you need
FROM runpod/worker-comfyui:latest-z-image-turbo

# ────────────────────────────────────────────────
# Copy your exact workflow (so users don't have to send 2 kB JSON every request)
# ────────────────────────────────────────────────
COPY workflow.json /comfyui/input/workflow.json

# Optional: small start script to pre-warm or patch something
# (most people don't need this — the base image already runs ComfyUI + handler)
COPY start.sh /start.sh
RUN chmod +x /start.sh

# If you ever need extra custom nodes (not needed for your current workflow)
# RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git /comfyui/custom_nodes/ComfyUI-Manager && \
#     cd /comfyui/custom_nodes/ComfyUI-Manager && pip install -r requirements.txt

# Optional: force re-download of models if you suspect corruption (rarely needed)
# RUN rm -f /comfyui/models/diffusion_models/z_image_turbo_bf16.safetensors && \
#     wget -O /comfyui/models/diffusion_models/z_image_turbo_bf16.safetensors \
#     "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors"

# Environment variables that influence ComfyUI behavior
ENV COMFYUI_EXTRA_ARGS="--listen 0.0.0.0 --port 8188 --highvram --dont-print-server --quick-test-for-ci"

# The base image already has:
# CMD ["/start.sh"]
# so we usually don't override CMD unless we really need to
