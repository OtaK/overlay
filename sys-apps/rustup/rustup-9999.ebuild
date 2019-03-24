# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Rust toolchain installer"
HOMEPAGE="https://github.com/rust-lang/rustup.rs"
SRC_URI="https://sh.rustup.rs/rustup-init.sh"

KEYWORDS="~amd64"

LICENSE="Apache-2.0/MIT"
SLOT="0"
IUSE=""

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}"

src_install() {
    sh -s rustup-init.sh -- -y --default-toolchain stable
}
