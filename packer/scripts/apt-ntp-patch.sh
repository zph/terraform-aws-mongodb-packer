#!/usr/bin/env bash

set -eou pipefail

cat > /tmp/ntp.list <<EOF
## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://us-west-2.ec2.archive.ubuntu.com/ubuntu/ bionic universe
deb-src http://us-west-2.ec2.archive.ubuntu.com/ubuntu/ bionic universe
deb http://us-west-2.ec2.archive.ubuntu.com/ubuntu/ bionic-updates universe
deb-src http://us-west-2.ec2.archive.ubuntu.com/ubuntu/ bionic-updates universe
EOF

sudo mv /tmp/ntp.list /etc/apt/sources.list.d/ntp.list
