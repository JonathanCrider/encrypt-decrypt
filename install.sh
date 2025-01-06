#!/bin/zsh

TARGET_DIR="${HOME}/.local/bin"
SCRIPT_NAME="encrypt-decrypt"
SCRIPT_PATH="$TARGET_DIR/$SCRIPT_NAME"
SCRIPT_URL="https://raw.githubusercontent.com/JonathanCrider/encrypt-decrypt/main/$SCRIPT_NAME"

# Create directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Download source file and give relevant permissions
echo "downloading script $SCRIPT_NAME"

if [[ curl -o "$SCRIPT_PATH" -sSl "$SCRIPT_URL" ]]
  then
    chmod +x "$SCRIPT_PATH"
    echo "Downloaded and installed '$SCRIPT_NAME' into '$SCRIPT_PATH'"
  else
    echo "Failed to download '$SCRIPT_NAME'. Please check your internet connection or the URL"
    exit 1
fi

# Add sourcing to .zshrc
SHELL_CONFIG="$HOME/.zshrc"
SOURCE_CMD="source $SCRIPT_PATH"

if [[ ! grep -q "$SOURCE_CMD" "$SHELL_CONFIG" ]]
  then
    echo "\n# Source encrypt/decrypt functions\n$SOURCE_CMD" >> "$SHELL_CONFIG"
    echo "Added '$SOURCE_CMD' to $SHELL_CONFIG."
fi

# Success
echo "Installation complete. Please restart your shell or run 'source $SHELL_CONFIG'."
