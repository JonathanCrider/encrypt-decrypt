#!/bin/zsh

TARGET_DIR="${HOME}/.local/bin"
SCRIPT_NAME="encrypt-decrypt"
SCRIPT_PATH="$TARGET_DIR/$SCRIPT_NAME"
SCRIPT_URL="https://raw.githubusercontent.com/JonathanCrider/encrypt-decrypt/main/$SCRIPT_NAME"

# Create directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Check if the script already exists
if [[ -f "$SCRIPT_PATH" ]]
  echo $TARGET_DIR
  echo $SCRIPT_NAME
  echo $SCRIPT_PATH
  echo $SCRIPT_URL
  # then
  #   echo "The script '$SCRIPT_NAME' already exists in $TARGET_DIR."
  #   echo "Do you want to overwrite it? [y/N]: "
  #   read -r "response"
  #   if [[ "$response" != "y" && "$response" != "Y" ]]
  #     then
  #       echo "Installation canceled."
  #       exit 0
  #   fi
  #   rm $SCRIPT_PATH
fi

# Download source file and give relevant permissions
echo "downloading script $SCRIPT_NAME"
if curl -o "$SCRIPT_PATH" -sSl "$SCRIPT_URL"
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
  else
    echo "Something went wrong, please try again"
    return 1
fi

# Success
echo "Installation complete. Please restart your shell or run 'source $SHELL_CONFIG'."
