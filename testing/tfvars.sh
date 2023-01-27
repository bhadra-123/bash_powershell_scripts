#!/bin/bash

set -u

b=1
c=2

cat <<EOF > terraform.tfvars
a="${b}${c}"
d="($b $c)"
e=${b}
EOF