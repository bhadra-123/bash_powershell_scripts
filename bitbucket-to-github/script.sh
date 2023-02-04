#!/bin/bash

dir="migration"

source_repo="to_be_migrated_repo"

dest_repo="from_bitbucket_2_github"

git clone git@bitbucket.org:bhadra-757/$source_repo.git $dir

cd $dir

git remote add github git@github.com:bhadra-123/$dest_repo.git

git fetch --all

git push --all github

git branch --set-upstream-to=github/*

cd ..