#!/bin/zsh

TARGET_DIR="${HOME}/.local/bin"
SCRIPT_NAME="encrypt-decrypt"
SCRIPT_PATH="$TARGET_DIR/$SCRIPT_NAME"
SHELL_CONFIG="$HOME/.zshrc"

# Remove the script
if [[ -f "$SCRIPT_PATH" ]]; then
  rm "$SCRIPT_PATH"
  echo "Removed '$SCRIPT_NAME' from $TARGET_DIR."
else
  echo "'$SCRIPT_NAME' is not installed in $TARGET_DIR."
fi

# Remove the source line from .zshrc
if grep -qF "source $SCRIPT_PATH" "$SHELL_CONFIG"
  then
    sed -i '' "/source $SCRIPT_PATH/d" "$SHELL_CONFIG"
    echo "Removed sourcing line from $SHELL_CONFIG."
  else
    echo "No sourcing line found in $SHELL_CONFIG."
fi

echo "Uninstallation complete."
