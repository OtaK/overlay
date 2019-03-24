# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit git-r3 bash-completion-r1

EGIT_REPO_URI="https://github.com/tj/git-extras.git"
DESCRIPTION="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
HOMEPAGE="https://github.com/tj/git-extras"

KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-vcs/git"

src_compile() {
    git-r3_fetch "refs/tags/${PV}"
    git-r3_checkout ${PV}
    :;
    # we skip this because the first target of the
    # Makefile is "install" and plain "make" would
    # actually run "make install"

}

src_install() {
    emake DESTDIR="${D}" PREFIX="/usr" install
    nonfatal dodoc Readme.md
    nonfatal newbashcomp "${D}/etc/bash_completion.d/${PN}" ${PN}
}
