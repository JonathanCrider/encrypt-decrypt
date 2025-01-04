# Encrypt and Decrypt tool for command line

Adds a quick way to encrypt and decrypt a file using openssl aes-256-cbc

Do note, this was written on MacOS running zsh, so you may need to modify the code to run in your specific environment

## Installation

There are two ways to use this code, I prefer the first.

### Option 1

Save the `.encrypt-decrypt` file in your root directory and paste the following into your `.zshrc` file

```bash
# Import encrypt/decrypt functions from ~/.encrypt-decrypt
if [ -f $HOME/.zsh_custom_code ]; then
    source $HOME/.encrypt-decrypt
fi
```

### Option 2

Copy/paste the code into your `.zshrc` file

## Usage

Once the code is saved and available (you may need to refresh or open a new terminal window), you have 2 commands:

`encrypt`

`decrypt`

They both take 2 arguments:

  1. path to original file name
  2. path to target file name

### Examples

```bash
encrypt ~/path/to/originalfile.txt ~/path/to/encryptedfile.txt
```

```bash
decrypt ~/path/to/encryptedfile.txt ~/path/to/decryptedfile.txt
```

## Notes

You will be prompted for a password, but no character indication will appear in the terminal as you type. This is normal, but be sure to type it correctly!
