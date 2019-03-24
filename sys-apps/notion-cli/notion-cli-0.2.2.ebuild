# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cargo

EGIT_REPO_URI="https://github.com/notion-cli/notion.git"
DESCRIPTION="Notion: the hassle-free JavaScript toolchain manager"
HOMEPAGE="https://github.com/notion-cli/notion"

KEYWORDS="~amd64"

LICENSE="BSD-2"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND=""

src_compile() {
    git-r3_fetch $EGIT_REPO_URI refs/tags/v${PV}
    git-r3_checkout $EGIT_REPO_URI "v${PV}"
    cargo_src_compile
    cargo_src_test
}

src_install() {
    cargo_src_install
}
