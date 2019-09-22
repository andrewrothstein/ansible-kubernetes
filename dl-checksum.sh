#!/usr/bin/env sh
MAJOR_VER=1
MINOR_VER=16
PATCH_VER=0
VER="v${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}"
DIR=~/Downloads
MIRROR=https://dl.k8s.io/$VER

dl()
{
    local k8sdistro=$1
    local os=$2
    local arch=$3

    local rfile=$MIRROR/kubernetes-$k8sdistro-$os-$arch.tar.gz
    local lfile=$DIR/kubernetes-$VER-$k8sdistro-$os-$arch.tar.gz
    if [ ! -e $lfile ]; then
        wget -q -O $lfile $rfile
    fi

    printf "        # %s\n" $rfile
    printf "        %s: sha256:%s\n" $arch $(sha256sum $lfile | awk '{print $1}')
}

printf "  # %s\n" https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-${MAJOR_VER}.${MINOR_VER}.md
printf "  %s:\n" $VER
printf "    %s:\n" client

printf "      %s:\n" darwin
dl client darwin 386
dl client darwin amd64

printf "      %s:\n" linux
dl client linux 386
dl client linux amd64
dl client linux arm
dl client linux arm64
dl client linux ppc64le
dl client linux s390x

printf "      %s:\n" windows
dl client windows 386
dl client windows amd64

printf "    %s:\n" server
printf "      %s:\n" linux
dl server linux amd64
dl server linux arm
dl server linux arm64
dl server linux ppc64le
dl server linux s390x

printf "    %s:\n" node
printf "      %s:\n" linux
dl node linux amd64
dl node linux arm
dl node linux arm64
dl node linux ppc64le
dl node linux s390x
dl node windows amd64

