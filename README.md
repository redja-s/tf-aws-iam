# Configure a personal AWS account with groups and users for use

### Deploying this code
This code creates the following:
- An admin group with a list of users defined in `main.tf`
- An OIDC provider for use with GitHub Actions
- An IAM role that GitHub Actions runners can use to run commands against our AWS account

### Steps
1. Run `generate-key-file.sh` to create a GPG key file to use for encrypting user passwords: `./scripts/generate-key-file.sh <name> <email>`
2. Run `terraform init`
3. Run `terraform apply`
4. To retrieve the unencrypted passwords for your admin users, run `.scripts/decrypt-user-passwords.sh`

### Example
```
$ ./scripts/generate-key-file.sh Jared user@gmail.com
$ terraform init
$ terraform apply --auto-approve
$ ./scripts/decrypt-user-password.sh
```
