# ansible-tf-nagios-server
Terraform templates and an ansible playbook to standup a basic nagios server on a RHEL 8 host

# Description

This project creates basic nagios server using Ansible. The Ansible playbook calls on the terraform module to first provision the nagios server in AWS. Then, it performs nagios installation and configuration.

# Prerquisites

1. Linux box with the following installed (tested on CentOS 7)
   - ansible
   - [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)
   - [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. A key pair created in AWS and a downloaded copy available on the linux box

# AWS CLI Setup

Before launching the Ansible playbook, first create an IAM user with programmatic access if not done so already. An access key and secret key will be tied to the user and used to configure the aws cli.

https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

```
# aws configure --profile <profile_name>
AWS Access Key ID [None]: ********
AWS Secret Access Key [None]: ********
Default region name [None]:
Default output format [None]:
```

# Execution

1. On linux box, satisfy prerequisites (See above)
2. git clone
3. Configure aws cli (see above)
4. Update terraform variables (ansible-tf-nagios-server/terraform/dev.auto.tfvars)
     - aws_profile: aws profile name used in aws cli setup
     - region: aws region
     - env: tag given for aws resources
     - instance_ami: RHEL 8 image ami for nagios server (Ensure it is available in aws region)
     - instance_type: instance type for nagios server
     - key_name: key pair associated with aws instance
     - volume_type: volume type for nagios server
     - instance_size: volume size for nagios server
5. Update ansible variables (ansible-tf-nagios-server/ansible/inventories/group_vars/nagios-server/vars.yaml)
     - nagios_tar: url to nagios tar
     - nagios_admin_user: nagios admin user
6. Update ansible vault variables (ansible-tf-nagios-server/ansible inventories/group_vars/all/vault.yaml) - vaul password: passw0rd
     - nagios_admin_pass: password for nagios admin user
```
# ansible edit ansible-tf-nagios-server/ansible inventories/group_vars/all/vault.yaml
```
7. Change to terraform directory and run terraform init.
```
# cd ansible-tf-nagios-server/terraform
# terraform init
```
8. Change to ansible directory and execute ansible playbook
```
# cd ../ansible
# ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook nagios-server.yaml -i inventories/hosts --private-key=<path to private key> --ask-vault
```