# Docker in Docker with AWS CLI

This is a Docker image intended for building other
Docker images and pushing them to AWS ECR with the 
AWS CLI.

It works well with Jenkins and Kubernetes plugin
but will likely work with other container based
CI/CD solutions, too.

If you have special needs,
[file an issue](https://github.com/fiskeben/aws-docker-in-docker/issues/new).

## Usage

### ECR Login

The easiest way to use the image is in a CI/CD tool that
allows you to "bring your own container"
(Jenkins, CircleCI).
Here you can run the Docker commands you need to build,
tag, and push your image.

Make sure to have AWS credentials with the proper access
to your repository available, for example as environment
variables.

Use
`eval $(aws ecr get-login --registry-ids <ID> --no-include-email --region <region>)`
to login to your ECR registry.

### Fast and Easy Tagging

The image ships with a convenience script for tagging
images in ECR.

For example:

`tag-image my-image v1.2.3 eu-central-1`

* `my-image` is the name of the image (ECR repository)
  you want to tag.
* `v1.2.3` is the tag.
* `eu-central-1` is the region the registry is located in.

All arguments are required.

This will tag images directly in the repository without
having to upload or download anything.

