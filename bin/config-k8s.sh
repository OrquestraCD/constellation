#!/usr/bin/env bash
# common.sh

# Only use TTY for Docker if we detect one, otherwise
# this will balk when run in Jenkins
# Thanks https://stackoverflow.com/a/48230089
declare USE_TTY
test -t 1 && USE_TTY="-t" || USE_TTY=""

declare INPUT_ENABLED
test -t 1 && INPUT_ENABLED="true" || INPUT_ENABLED="false"

export INPUT_ENABLED USE_TTY

export CLUSTER_NAME="k8s-eks-scaling-demo-cluster"
export REPO_BASE_URI="976851222302.dkr.ecr.us-west-2.amazonaws.com/k8s-eks-scaling-demo-repo"

function container-name(){
	env=$1;	app=$2; ver=$3
	export CNAME="k8s-${env}-${app}:${ver}"
}