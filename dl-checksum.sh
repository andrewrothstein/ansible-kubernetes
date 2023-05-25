#!/usr/bin/env bash
set -e
DIR=~/Downloads
MIRROR=https://dl.k8s.io

dl()
{
    local ver=$1
    local k8sdistro=$2
    local os=$3
    local arch=$4

    local -r suffix="${k8sdistro}-${os}-${arch}.tar.gz"
    local -r rfile="${MIRROR}/${ver}/kubernetes-${suffix}"
    local -r lfile="$DIR/kubernetes-${ver}-${suffix}"
    if [ ! -e $lfile ]; then
        curl -sSLf -o $lfile $rfile
    fi

    printf "        # %s\n" $rfile
    printf "        %s: sha256:%s\n" $arch $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local major_ver=$1
    local minor_ver=$2
    local patch_ver=$3

    local ver="v${major_ver}.${minor_ver}.${patch_ver}"
    printf "  # %s\n" https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-${major_ver}.${minor_ver}.md
    printf "  %s:\n" $ver
    printf "    %s:\n" client

    printf "      %s:\n" darwin
    dl $ver client darwin amd64
    dl $ver client darwin arm64

    printf "      %s:\n" linux
    dl $ver client linux 386
    dl $ver client linux amd64
    dl $ver client linux arm
    dl $ver client linux arm64
    dl $ver client linux ppc64le
    dl $ver client linux s390x

    printf "      %s:\n" windows
    dl $ver client windows 386
    dl $ver client windows amd64
    dl $ver client windows arm64

    printf "    %s:\n" server
    printf "      %s:\n" linux
    dl $ver server linux amd64
    #dl $ver server linux arm
    dl $ver server linux arm64
    dl $ver server linux ppc64le
    dl $ver server linux s390x

    printf "    %s:\n" node
    printf "      %s:\n" linux
    dl $ver node linux amd64
    #dl $ver node linux arm
    dl $ver node linux arm64
    dl $ver node linux ppc64le
    dl $ver node linux s390x
    printf "      %s:\n" windows
    dl $ver node windows amd64
}

dl_ver 1 27 2
