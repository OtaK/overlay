# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
KEYWORDS="amd64 x86"

HOMEPAGE="https://github.com/zen-kernel/zen-kernel"

K_SECURITY_UNSUPPORTED="1"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_NOSETEXTRAVERSION="1"

ZEN_EXTRAVERSION="zen1"

inherit kernel-2
detect_version
detect_arch

RDEPEND="virtual/linux-sources"

DESCRIPTION="Linux - Zen flavour"

K_BRANCH_ID="5.16"

ZEN_URI="https://github.com/zen-kernel/zen-kernel/releases/download/v${PV}-${ZEN_EXTRAVERSION}/v${PV}-${ZEN_EXTRAVERSION}.patch.xz"

SRC_URI="
	${KERNEL_URI} 
	${GENPATCHES_URI}
	${ARCH_URI}
	${ZEN_URI}
	"

UNIPATCH_LIST="${DISTDIR}/v${PV}-${ZEN_EXTRAVERSION}.patch.xz"
UNIPATCH_STRICTORDER="yes"

pkg_postinst() {
	kernel-2_pkg_postinst
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
