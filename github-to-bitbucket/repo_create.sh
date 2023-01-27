DESTINATION_REPO="github-to-bitbucket"
BITBUCKET_USER="bhadra-757"
BITBUCKET_PASS="ATBBw5Eudkq5XwfMHXfSuRKaPw980C742809"

# curl --user bhadra-757:ATBBw5Eudkq5XwfMHXfSuRKaPw980C742809 https://api.bitbucket.org/2.0/repositories/ \
#     --data name=github-to-bitbucket

curl -X POST -v -u bhadra-757:ATBBw5Eudkq5XwfMHXfSuRKaPw980C742809 -H "Content-Type: application/json" \
  https://api.bitbucket.org/2.0/repositories/ \
    --data name=github-to-bitbucket \
    -d '{"scm": "git", "is_private": "true", "fork_policy": "no_public_forks" }'    