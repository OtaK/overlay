# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop unpacker xdg-utils

DESCRIPTION="100% Free Time Tracking Software"
HOMEPAGE="https://clockify.me"
SRC_URI="https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.deb"

SLOT="0"
KEYWORDS="~amd64"
IUSE="+libnotify doc"

RDEPEND="app-crypt/libsecret
		dev-libs/libgcrypt
		dev-libs/nss
		dev-libs/openssl
		gnome-base/gconf
		gnome-base/gnome-keyring
		gnome-base/gvfs
		media-libs/libglvnd
		media-libs/mesa
		virtual/libudev
		libnotify? ( x11-libs/libnotify )
		media-video/ffmpeg[chromium]
		x11-misc/xdg-utils
		x11-libs/libXtst"


S="${WORKDIR}"
QA_PREBUILT="*"

src_prepare() {
	rm "clockify/"*".so"
	rm -r "clockify/swiftshader"
	default
}

src_install() {
	if use doc ; then
		dodoc -r "usr/share/doc"*
	fi

	insinto "/opt/clockify"
	doins -r "opt/Clockify/"*

	insinto "/usr/share"
	doins -r "usr/share/icons" "usr/share/applications"

	dosym "/usr/"$(get_libdir)"/chromium/libffmpeg.so" "/opt/clockify/libffmpeg.so"

	exeinto "/opt/clockify"
	doexe "opt/Clockify/clockify"
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

