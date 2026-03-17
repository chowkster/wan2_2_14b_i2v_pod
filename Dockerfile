# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui
# No registry-verified custom nodes to install.
# The following unknown_registry nodes could not be resolved (no aux_id provided) and were skipped:
# - MarkdownNote
# - MarkdownNote
# - MarkdownNote

# download models into comfyui

# COPY input/ /comfyui/input/
