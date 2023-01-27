#!/bin/bash

# This script uses .netrc file to clone/push repositories. This will eliminate entering Username and Password for GitHub and BitBucket everytime you clone/push the repository.

source_repo="github-to-bitbucket"

TMP_DIR="/tmp/github_to_bitbucket"

tmp_dir="${TMP_DIR}/${source_repo}"

mkdir -p "${tmp_dir}"

cd "${tmp_dir}"

git clone --bare "https://github.com/bhadra-123/${source_repo}.git" .

git push --mirror "https://bhadra-757@bitbucket.org/bhadra-757/${source_repo}.git"