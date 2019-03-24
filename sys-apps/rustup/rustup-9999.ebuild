# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cargo git-r3

EGIT_REPO_URI="https://github.com/rust-lang/rustup.rs.git"
DESCRIPTION="The Rust toolchain installer"
HOMEPAGE="https://github.com/rust-lang/rustup.rs"

KEYWORDS="~amd64"

LICENSE="Apache-2.0/MIT"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND=""

src_compile() {
    git-r3_fetch $EGIT_REPO_URI refs/heads/stable
    git-r3_checkout $EGIT_REPO_URI stable
    cargo_src_compile
}

src_install() {
    cargo run --release -- -y --default-toolchain stable
}
