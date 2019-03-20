# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils gnome2-utils

DESCRIPTION="Sophisticated text editor for code, markup and prose"
HOMEPAGE="http://www.sublimetext.com"
BASE_URI="https://download.sublimetext.com"
SRC_URI="${BASE_URI}/sublime_text_3_build_${PV}_x64.tar.bz2"

LICENSE="Sublime"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror bindist"

DEPEND=">=media-libs/libpng-1.6.35-r1:*
    >=x11-libs/gtk+-2.24.32-r1:*
    dbus? ( sys-apps/dbus )"
RDEPEND="${DEPEND}"

pkg_nofetch() {
    eerror "Sublime Text download website seems to be down :("
}

src_install() {
    local targetdir="/opt/sublime_text_3"
    instinto "$targetdir"
    into "$targetdir"
    exeinto "$targetdir"
    doins -r "Icon"
    doins -r "Packages"
    doins "python3.3.zip"
    doins "sublime.py"
    doins "sublime-plugin.py"
    doexe "sublime_text"
    doexe "plugin_host"

    local size
    for size in 16 32 48 128 256 ; do
        insinto /usr/share/icons/hicolor/${size}x${size}/apps
        newins "Icon/${size}x${size}/sublime-text.png" sublime_text.png
    done

    domenu "sublime_text.desktop"
}

pkg_preinst() {
    gnome2_icon_savelist
}

pkg_postinst() {
    gnome2_icon_cache_update
    dosym $bindir/subl${MV} /usr/bin/subl
}
