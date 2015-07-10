#!/usr/bin/env bash

for branch in $(git for-each-ref --format='%(refname)' refs/heads/); do
    git push origin "$branch"
done

