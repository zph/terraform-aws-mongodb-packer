#!/usr/bin/env bash

set -eou pipefail
set -x

# Pre-reqs
sudo apt-get update
# common is for apt-add-repository
sudo apt-get install -y curl gpg lsb-release software-properties-common unzip

# https://www.consul.io/downloads
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get install -y consul

curl https://releases.hashicorp.com/consul-template/0.27.2/consul-template_0.27.2_linux_amd64.zip > /tmp/consul-template.zip
(
  cd /tmp || exit 1
  unzip consul-template.zip
  chmod +x consul-template
  sudo mv /tmp/consul-template /usr/local/bin/

  rm -f consul-template.zip
)

# TODO: setup consul auto-joining somehow
