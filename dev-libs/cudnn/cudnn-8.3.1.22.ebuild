# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CUDA_PV=11.5

DESCRIPTION="NVIDIA Accelerated Deep Learning on GPU library"
HOMEPAGE="https://developer.nvidia.com/cuDNN"

MY_PV_MAJOR=$(ver_cut 1-2)
ARCHIVE_PATH="cudnn-linux-x86_64-${PV}_cuda${CUDA_PV}-archive"
SRC_URI="${ARCHIVE_PATH}.tar.xz"

SLOT="0/7"
KEYWORDS="~amd64 ~amd64-linux"
RESTRICT="fetch"
LICENSE="NVIDIA-cuDNN"
QA_PREBUILT="*"

S="${WORKDIR}/${ARCHIVE_PATH}"

DEPEND="=dev-util/nvidia-cuda-toolkit-${CUDA_PV}*"
RDEPEND="${DEPEND}"

src_install() {
	insinto /opt/cuda/targets/x86_64-linux/include
	doins -r include/*

	insinto /opt/cuda/targets/x86_64-linux/lib
	doins -r lib*/*
}
