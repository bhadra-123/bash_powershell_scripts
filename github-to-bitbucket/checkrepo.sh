#!/usr/bin/env bash
exists_public_github_repo() {
  local bhadra-123/github-to-bitbucket=$1

  if curl -fsS "https://api.github.com/repos/${bhadra-123/github-to-bitbucket}" >/dev/null; then
    printf '%s\n' "The GitHub repo ${bhadra-123/github-to-bitbucket} exists." >&2
    return 0
  else
    printf '%s\n' "Error: no GitHub repo ${bhadra-123/github-to-bitbucket} found." >&2
    return 1
  fi
}

if exists_public_github_repo "ocaml/ocaml"; then
  echo "OK"
fi