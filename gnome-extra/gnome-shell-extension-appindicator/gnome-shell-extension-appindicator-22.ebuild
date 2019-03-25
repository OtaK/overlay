# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

EGIT_REPO_URI="https://github.com/ubuntu/gnome-shell-extension-appindicator.git"
DESCRIPTION="Adds KStatusNotifierItem support to the Shell A.K.A. SysTray"
HOMEPAGE="https://github.com/ubuntu/gnome-shell-extension-appindicator"

LICENSE="GPL-2+"
KEYWORDS="~amd64"
SLOT="0"

DEPEND="
    app-eselect/eselect-gnome-shell-extensions
"
RDEPEND="
    ${DEPEND}
    dev-libs/libappindicator
    <gnome-base/gnome-shell-3.31
"

src_compile() {
    git-r3_fetch $EGIT_REPO_URI refs/tags/v${PV}
    git-r3_checkout $EGIT_REPO_URI v${PV}
    :;
}

src_install() {
    local _u=$(awk -F'"' '/uuid/ {print $4}' metadata.json)
    insinto /usr/share/gnome-shell/extensions/${_u}
    doins -r interfaces-xml *.js{,on}
    dodoc {AUTHORS,README}.md
}

pkg_postinst() {
    ebegin "Updating list of installed extensions"
    eselect gnome-shell-extensions update
    eend $?
}

pkg_postrm() {
    ebegin "Updating list of installed extensions"
    eselect gnome-shell-extensions update
    eend $?
}
