#!/bin/zsh

TARGET_DIR="${HOME}/.local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/JonathanCrider/encrypt-decrypt/main/encrypt-decrypt"

# Create directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Download source file and give relevant permissions
curl -o "$TARGET_DIR/encrypt-decrypt" "$SCRIPT_URL"
chmod +x "$TARGET_DIR/encrypt-decrypt"

# Add sourcing to .zshrc
SHELL_CONFIG="$HOME/.zshrc"

if ! grep -q "source $TARGET_DIR/encrypt-decrypt" "$SHELL_CONFIG"
  then
    echo "\n# Source encrypt/decrypt functions\nsource $TARGET_DIR/encrypt-decrypt" >> "$SHELL_CONFIG"
    echo "Added 'source $TARGET_DIR/encrypt-decrypt' to $SHELL_CONFIG."
  else
    echo "Something went wrong, please try again"
    return 1
fi

# Success
echo "Installation complete. Please restart your shell or run 'source $SHELL_CONFIG'."
