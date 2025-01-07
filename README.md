# Encrypt and Decrypt tool for command line

Adds a quick, simple way to encrypt and decrypt a file using openssl aes-256-cbc with PBKDFT and a salt. Relatively secure way to share a sensitive file with a password, so long as you follow password and other security best practices.

Do note, this was written on MacOS running zsh, so you may need to modify the code to run in your specific environment

## Installation

Run the following command in your terminal to install the functions and create sourcing in your `.zshrc` file:

Feel free to check the `install.sh` file before you use this.

```zsh
curl -sSL https://raw.githubusercontent.com/JonathanCrider/encrypt-decrypt/main/install.sh | zsh
```

After installation, be sure to open a new terminal or refresh your `.zshrc` using the following command:

```zsh
source ~/.zshrc
```

Pro tip: add an alias (shortcut) for refreshing your terminal.

Copy/paste the command below to add the alias to your `.zshrc` file. You will need to run the command above to use it the first time, or open a new terminal.

```zsh
echo -e "\n# ALIAS to refresh terminal\nalias refresh='source ~/.zshrc'" >> ~/.zshrc
```

## Usage

Once the code is saved and available (you may need to refresh or open a new terminal window), you have 2 commands:

`encrypt`

`decrypt`

They both take 2 arguments:

  1. path to original file name
  2. path to target file name

### Examples

```bash
# any directory
encrypt ~/path/to/originalfile.txt ~/path/to/encryptedfile.txt

# same directory
encrypt test.txt test-encrypted.txt
```

```bash
# any directory
decrypt ~/path/to/encryptedfile.txt ~/path/to/decryptedfile.txt

# same directory
decrypt test-encrypted.txt test-decrypted.txt
```

## Uninstall

Run the following command to uninstall the script:

```zsh
curl -sSL https://raw.githubusercontent.com/JonathanCrider/encrypt-decrypt/main/uninstall.sh | zsh
```
