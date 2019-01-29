#!/usr/bin/env sh
VER=v1.12.2
DIR=~/Downloads
MIRROR=https://dl.k8s.io/$VER

dl()
{
    K8SDISTRO=$1
    OS=$2
    PLATFORM=$3

    REMOTEFILENAME=kubernetes-$K8SDISTRO-$OS-$PLATFORM.tar.gz
    LOCALFILENAME=kubernetes-$VER-$K8SDISTRO-$OS-$PLATFORM.tar.gz
    wget -O $DIR/$LOCALFILENAME $MIRROR/$REMOTEFILENAME
}

dl client darwin 386
dl client darwin amd64
dl client linux 386
dl client linux amd64
dl client linux arm
dl client linux arm64
dl client linux ppc64le
dl client linux s390x
dl client windows 386
dl client windows amd64

dl server linux amd64
dl server linux arm
dl server linux arm64
dl server linux ppc64le
dl server linux s390x

dl node linux amd64
dl node linux arm
dl node linux arm64
dl node linux ppc64le
dl node linux s390x
dl node windows amd64

sha256sum $DIR/kubernetes-$VER-*

