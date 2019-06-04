#!/bin/sh

#
# This script will tag the "latest" image in a repository
# with the supplied tag.
#
# The script takes three parameters:
#
# repo name: the name of the AWS ECR repo that holds the image
# tag: the value to use as the tag
# region: the AWS region of your registry
#
# All parameters are mandatory.

set -e

usage() {
        echo "Usage:"
        echo "$(basename $0) reponame tag region"
        exit 1
}

repo=$1
tag=$2
region=$3

[ -z "$repo" ] && usage
[ -z "$tag" ] && usage
[ -z "$region" ] && usage

echo "Tagging ${repo}:${tag} ($region)"

MANIFEST=$(aws ecr batch-get-image --repository-name $repo --region $region --image-ids imageTag=latest --query 'images[].imageManifest' --output text)
aws ecr put-image --repository-name $repo --image-tag $tag --region $region --image-manifest "$MANIFEST"

