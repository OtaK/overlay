# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils gnome2-utils

# get the major version from PV
MV="${PV:0:1}"

MY_PN=${PN/-/_}
MY_MV_PN="${MY_PN}_${MV}"
MY_P="Sublime%20Text"
S="${WORKDIR}/${MY_MV_PN}"

DESCRIPTION="Sophisticated text editor for code, markup and prose"
HOMEPAGE="http://www.sublimetext.com"

BASE_URI="https://download.sublimetext.com"
SRC_URI="amd64? ( ${BASE_URI}/${MY_PN}_build_${PV}_x64.tar.xz )"
LICENSE="Sublime"
SLOT="4"
KEYWORDS="~amd64"
IUSE="multislot dbus"
RESTRICT="bindist mirror strip"

DEPEND=">=media-libs/libpng-1.2.46:*
	dev-libs/glib:2
	x11-libs/gtk+:3
	x11-libs/libX11
	multislot? ( app-eselect/eselect-sublime )
	dbus? ( sys-apps/dbus )"
RDEPEND="${DEPEND}"

QA_PREBUILT="*"
S="${WORKDIR}/sublime_text"

pkg_nofetch() {
	eerror "Sublime Text official site seems to be unresponsive."
}

src_install() {
	local targetdir="/opt/${MY_MV_PN}"

	insinto "$targetdir"
	into "$targetdir"
	exeinto "$targetdir"
	doins -r "Icon"
	doins -r "Packages"
	doins -r "Lib"

	doins "libcrypto.so.1.1"
	doins "libssl.so.1.1"

	doexe "sublime_text"
	doexe "plugin_host-3.3"
	doexe "plugin_host-3.8"
	dosym "$targetdir/sublime_text" /usr/bin/subl${MV}

	local size
	for size in 16 32 48 128 256 ; do
		insinto /usr/share/icons/hicolor/${size}x${size}/apps
		newins "Icon/${size}x${size}/sublime-text.png" sublime_text_${MV}.png
	done

	make_desktop_entry "subl${MV} %F" "Sublime Text ${MV}" sublime_text${MV} "Development;TextEditor;IDE" "StartupNotify=true"
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
	if use multislot; then
		eselect_sublime_update
	else
		local bindir="/usr/bin"
		einfo "using major version ${MV} as default"
		dosym $bindir/subl${MV} /usr/bin/subl
	fi
}

pkg_postrm() {
	gnome2_icon_cache_update
}

eselect_sublime_update() {
	einfo
	elog "Updating Sublime Text to the latest installed version"
	elog "you can select the version you want to use just using"
	elog
	elog "eselect sublime set sublime_text_2"
	einfo
	eselect sublime set sublime_text_${MV} --use-old
}
