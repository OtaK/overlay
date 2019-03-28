# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

SRC_URI="https://github.com/shumatech/BOSSA/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS=""
RESTRICT="primaryuri"

DESCRIPTION="BOSSA is a flash programming utility for Atmel's SAM family of flash-based ARM microcontrollers."
HOMEPAGE="https://github.com/shumatech/BOSSA"

LICENSE="BSD 3-clause "New" or "Revised" License"
SLOT="0"
IUSE=""
S="${WORKDIR}/BOSSA-${PV}"

RDEPEND="x11-libs/wxGTK"
DEPEND="${RDEPEND}"

src_prepare() {
    eapply_user
    :;
}

src_compile() {
    emake all
}

src_install() {
    dobin bin/bossa*
}
