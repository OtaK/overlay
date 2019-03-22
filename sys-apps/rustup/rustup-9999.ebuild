# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The Rust toolchain installer"
HOMEPAGE="https://github.com/rust-lang/rustup.rs"

KEYWORDS="~amd64"

LICENSE="Apache-2.0/MIT"
SLOT="0"
IUSE=""

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}"

src_install() {
    curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable
}
