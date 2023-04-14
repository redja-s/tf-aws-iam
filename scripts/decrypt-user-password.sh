#!/bin/bash

VALUE_MAP=$(terraform output -json | jq -r '.user_passwords.value')

while IFS="=" read -r user encrypted_password; do
    unencrypted_password=$(echo $encrypted_password | tr -d '[:space:]' | base64 --decode | gpg --decrypt)
    echo "User:$user -- Password:$unencrypted_password"
done < <(echo "$VALUE_MAP" | jq -r 'to_entries[] | .key + "=" + .value')
