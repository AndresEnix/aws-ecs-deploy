#!/bin/bash -e

# imports
. ./utils.sh --source-only

# vars
BRANCH_NAME=''
COMMIT_HASH=''
CFT_BASE_NAME='ae-templates-for'
PEM_BASE_NAME='ae-keys-for'
CFT_BUCKET=''
PEM_BUCKET=''
AWS_REGION='us-east-1'

# Body
checkout
synch_files $CFT_BUCKET "cfn-templates" true
create_environment_key "$BRANCH_NAME-key" "keys" $PEM_BUCKET
ansible-playbook ansible-playbooks/setup-network.yml --extra-vars "branch_name=$BRANCH_NAME commit_hash=$COMMIT_HASH cf_bucket=$CFT_BUCKET aws_region=$AWS_REGION"