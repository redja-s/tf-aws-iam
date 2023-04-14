#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Requires 2 arguments: e.g. ./scripts/generate-key-file.sh <user_name> <email>"
    exit 1
fi

USER_NAME=$1
EMAIL=$2

# Validate email is syntactically correct
PATTERN="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

# Check if email address is valid
if [[ !($EMAIL =~ $PATTERN) ]]; then
    echo "'$EMAIL' is not a valid email address."
    echo "Aborting..."
    exit 1
fi

cat << EOF > key-template
Key-Type: RSA
Subkey-Type: RSA
Name-Real: $USER_NAME
Name-Comment: PGP key for tf-aws-iam user encryption
Name-Email: $EMAIL
Expire-Date: 0
EOF

export GPG_TTY=$(tty)

if gpg --list-keys "${EMAIL}" >/dev/null; then
    echo "Key with email already found, skipping creation"
else
    echo "No key found for email $EMAIL"
    echo "Creating GPG key to use..."
    echo
    gpg --batch --gen-key key-template
    sleep 5
fi

gpg --output public_key.gpg --export ${EMAIL}