# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-devel/autoconf/autoconf-2.59-r7.ebuild,v 1.18 2013/04/04 22:59:16 vapier Exp $

inherit eutils

DESCRIPTION="Used to create autoconfiguration files"
HOMEPAGE="http://www.gnu.org/software/autoconf/autoconf.html"
SRC_URI="mirror://gnu/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT=$(usex multislot "${PV}" "2.5")
KEYWORDS="~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE="emacs multislot"

DEPEND="=sys-devel/m4-1.4*
	dev-lang/perl"
RDEPEND="${DEPEND}
	sys-devel/autoconf-wrapper"
PDEPEND="emacs? ( app-emacs/autoconf-mode )"

src_unpack() {
	unpack ${A}
	cd "${S}"
	use multislot && find -name Makefile.in -exec sed -i '/^pkgdatadir/s:$:-@VERSION@:' {} +
	epatch "${FILESDIR}"/${P}-more-quotes.patch
}

src_compile() {
	# Disable Emacs in the build system since it is in a separate package.
	export EMACS=no
	econf --program-suffix="-${PV}" || die
	# econf updates config.{sub,guess} which forces the manpages
	# to be regenerated which we dont want to do #146621
	touch man/*.1
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS BUGS NEWS README TODO THANKS \
		ChangeLog ChangeLog.0 ChangeLog.1 ChangeLog.2

	if use multislot ; then
		local f
		for f in "${ED}"/usr/share/info/*.info* ; do
			mv "${f}" "${f/.info/-${SLOT}.info}" || die
		done
	fi
}
