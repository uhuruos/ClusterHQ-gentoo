# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/pyrenamer/pyrenamer-0.6.0-r2.ebuild,v 1.1 2014/06/11 15:09:08 mgorny Exp $

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 gnome2

DESCRIPTION="Mass rename files"
HOMEPAGE="http://www.infinicode.org/code/pyrenamer/"
SRC_URI="http://www.infinicode.org/code/${PN}/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="music"

RDEPEND="dev-python/pygtk:2[${PYTHON_USEDEP}]
	dev-python/gconf-python[${PYTHON_USEDEP}]
	music? (
		|| (
			app-misc/hachoir-metadata[${PYTHON_USEDEP}]
			<dev-python/eyeD3-0.7[${PYTHON_USEDEP}]
		)
	)"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	python_fix_shebang .
	gnome2_src_prepare
}
