#!/bin/bash

# Based on your output, your pipx home is here:
PIPX_HOME="$HOME/.local/pipx"
PIPX_BIN_DIR="$HOME/.local/bin"

echo "Targeting pipx home: $PIPX_HOME"

# 1. Remove the entire pipx directory (venvs and shared libs)
if [ -d "$PIPX_HOME" ]; then
    echo "Removing pipx storage..."
    rm -rf "$PIPX_HOME"
fi

# 2. Remove any symlink in .local/bin pointing to that path
# We check the target of the link directly rather than relying on -xtype
if [ -d "$PIPX_BIN_DIR" ]; then
    echo "Cleaning symlinks in $PIPX_BIN_DIR..."
    
    for link in "$PIPX_BIN_DIR"/*; do
        if [ -L "$link" ]; then
            # Get the absolute path the symlink points to
            target=$(readlink -f "$link")
            
            # If the link points into the (now deleted) PIPX_HOME, remove it
            if [[ "$target" == "$PIPX_HOME"* ]]; then
                echo "Removing broken link: $(basename "$link") -> $target"
                rm "$link"
            fi
        fi
    done
fi

echo "Cleanup complete."