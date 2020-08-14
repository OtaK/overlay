# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit desktop eutils pax-utils xdg

MY_INSTALL_DIR="/opt/${PN}"
MY_EXEC="code"
MY_PN=${PN/-bin/}

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
# linux-x64 folder path implies downloading tarball -> tar.gz
SRC_URI="https://update.code.visualstudio.com/${PV}/linux-x64/stable -> ${P}.tar.gz"
RESTRICT="mirror strip"
LICENSE="Microsoft"
SLOT="0"
KEYWORDS="*"
IUSE="libsecret hunspell"
DEPEND="
	media-libs/libpng
	>=x11-libs/gtk+-3.0
	x11-libs/cairo
	x11-libs/libXtst
"
RDEPEND="
	${DEPEND}
        >=net-print/cups-2.0.0
        x11-libs/libnotify
        x11-libs/libXScrnSaver
        dev-libs/nss
        hunspell? ( app-text/hunspell )
        libsecret? ( app-crypt/libsecret[crypt] )
"

pkg_setup() {
	S="${WORKDIR}/VSCode-linux-x64"
}

src_install() {
	local DEST="${MY_INSTALL_DIR}"
	pax-mark m "${DEST}/${MY_EXEC}"
	insinto "${DEST}"
	doins -r *
	dosym "${DEST}/bin/${MY_EXEC}" "/usr/bin/vscode"
	dosym "${DEST}/bin/${MY_EXEC}" "/usr/bin/code"
	make_wrapper "${PN}" "${DEST}/${MY_EXEC}"
	domenu ${FILESDIR}/${PN}.desktop
	newicon ${S}/resources/app/resources/linux/code.png ${PN}.png

	fperms +x "${DEST}/${MY_EXEC}"
	fperms 4755 "${DEST}/chrome-sandbox"
	fperms +x "${DEST}/libEGL.so"
	fperms +x "${DEST}/libGLESv2.so"
	fperms +x "${DEST}/libffmpeg.so"
	fperms +x "${DEST}/code"
	fperms +x "${DEST}/bin/code"
	fperms +x "${DEST}/resources/app/node_modules.asar.unpacked/vscode-ripgrep/bin/rg"
	fperms +x "${DEST}/resources/app/extensions/git/dist/askpass.sh"
	insinto "/usr/share/licenses/${PN}"
	newins "resources/app/LICENSE.rtf" "LICENSE.rtf"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_desktop_database_update
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_desktop_database_update
}
