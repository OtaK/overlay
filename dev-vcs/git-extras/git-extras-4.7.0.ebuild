# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3 bash-completion-r1

EGIT_REPO_URI="https://github.com/tj/git-extras.git"
EGIT_COMMIT="${PV}"
DESCRIPTION="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
HOMEPAGE="https://github.com/tj/git-extras"

KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-vcs/git"

src_compile() {
    :;
}

src_install() {
    emake DESTDIR="${D}" PREFIX="/usr" install
    nonfatal dodoc Readme.md
    nonfatal newbashcomp "${D}/etc/bash_completion.d/${PN}" ${PN}
}
