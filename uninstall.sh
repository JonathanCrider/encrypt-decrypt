#!/bin/zsh

# Globals
TARGET_DIR="${HOME}/.local/bin"
SCRIPT_NAME="encrypt-decrypt"
SCRIPT_PATH="$TARGET_DIR/$SCRIPT_NAME"
SHELL_CONFIG="$HOME/.zshrc"
SOURCE_CMD="source $SCRIPT_PATH"

# Remove the script
if [[ -f "$SCRIPT_PATH" ]]; then
  rm "$SCRIPT_PATH"
  echo "Removed '$SCRIPT_NAME' from $TARGET_DIR."
else
  echo "'$SCRIPT_NAME' is not installed in $TARGET_DIR."
fi

# Remove the source line from .zshrc
if grep -qF "$SOURCE_CMD" "$SHELL_CONFIG"
  then
    # for sed, you must change the delimiter when removing a line with
    # slashes, such as a path. Escape the new delimiter once at the beginning
    # of the line, i.e. "\~your/path/here~d" to use ~ in place of the usual /
    sed -i '' "\~# Source encrypt/decrypt functions~d" "$SHELL_CONFIG"
    sed -i '' "\~$SOURCE_CMD~d" "$SHELL_CONFIG"
    echo "Removed sourcing line from $SHELL_CONFIG."
  else
    echo "No sourcing line found in $SHELL_CONFIG."
fi

echo "Uninstallation complete."
