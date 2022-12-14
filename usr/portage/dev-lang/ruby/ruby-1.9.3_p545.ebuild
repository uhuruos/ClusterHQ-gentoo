# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/ruby/ruby-1.9.3_p545.ebuild,v 1.1 2014/02/26 14:20:28 graaff Exp $

EAPI=4

#PATCHSET=1

inherit autotools eutils flag-o-matic multilib versionator

RUBYPL=$(get_version_component_range 4)

MY_P="${PN}-$(get_version_component_range 1-3)-${RUBYPL:-0}"
S=${WORKDIR}/${MY_P}

SLOT=$(get_version_component_range 1-2)
MY_SUFFIX=$(delete_version_separator 1 ${SLOT})
# 1.9.3 still uses 1.9.1
RUBYVERSION=1.9.1

if [[ -n ${PATCHSET} ]]; then
	if [[ ${PVR} == ${PV} ]]; then
		PATCHSET="${PV}-r0.${PATCHSET}"
	else
		PATCHSET="${PVR}.${PATCHSET}"
	fi
else
	PATCHSET="${PVR}"
fi

DESCRIPTION="An object-oriented scripting language"
HOMEPAGE="http://www.ruby-lang.org/"
SRC_URI="mirror://ruby/1.9/${MY_P}.tar.bz2
		 http://dev.gentoo.org/~flameeyes/ruby-team/${PN}-patches-${PATCHSET}.tar.bz2"

LICENSE="|| ( Ruby-BSD BSD-2 )"
KEYWORDS="~ppc-aix ~x64-freebsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="berkdb debug doc examples gdbm ipv6 +rdoc rubytests socks5 ssl xemacs ncurses +readline +yaml" #libedit

# libedit support is removed everywhere because of this upstream bug:
# http://redmine.ruby-lang.org/issues/show/3698

RDEPEND="
	berkdb? ( sys-libs/db )
	gdbm? ( sys-libs/gdbm )
	ssl? ( dev-libs/openssl )
	socks5? ( >=net-proxy/dante-1.1.13 )
	ncurses? ( sys-libs/ncurses )
	readline?  ( sys-libs/readline )
	yaml? ( dev-libs/libyaml )
	virtual/libffi
	sys-libs/zlib
	>=app-admin/eselect-ruby-20100402
	!<dev-ruby/rdoc-3.9.4
	!<dev-ruby/rubygems-1.8.10-r1"
#	libedit? ( dev-libs/libedit )
#	!libedit? ( readline? ( sys-libs/readline ) )

DEPEND="${RDEPEND}"
PDEPEND="
	>=dev-ruby/rubygems-1.8.10-r1[ruby_targets_ruby19]
	rdoc? ( >=dev-ruby/rdoc-3.9.4[ruby_targets_ruby19] )
	xemacs? ( app-xemacs/ruby-modes )"

src_prepare() {
	epatch "${FILESDIR}/${PN}-1.9.1-only-ncurses.patch"
	epatch "${FILESDIR}/${PN}-1.9.1-prefix.patch"

	EPATCH_FORCE="yes" EPATCH_SUFFIX="patch" \
		epatch "${WORKDIR}/patches"

	einfo "Unbundling gems..."
	cd "$S"
	rm -r \
		{bin,lib}/rake lib/rake.rb man/rake.1 \
		ext/json \
		bin/gem || die "removal failed"

	# Fix a hardcoded lib path in configure script
	sed -i -e "s:\(RUBY_LIB_PREFIX=\"\${prefix}/\)lib:\1$(get_libdir):" \
		configure.in || die "sed failed"
	
	# Fix hardcoded SHELL var in mkmf library
	sed -e "s#\(SHELL = \).*#\1${EPREFIX}/bin/sh#" -i lib/mkmf.rb

	eautoreconf
}

src_configure() {
	local myconf=

	# -fomit-frame-pointer makes ruby segfault, see bug #150413.
	filter-flags -fomit-frame-pointer
	# In many places aliasing rules are broken; play it safe
	# as it's risky with newer compilers to leave it as it is.
	append-flags -fno-strict-aliasing
	# SuperH needs this
	use sh && append-flags -mieee

	# Socks support via dante
	if use socks5 ; then
		# Socks support can't be disabled as long as SOCKS_SERVER is
		# set and socks library is present, so need to unset
		# SOCKS_SERVER in that case.
		unset SOCKS_SERVER
	fi

	# Increase GC_MALLOC_LIMIT if set (default is 8000000)
	if [ -n "${RUBY_GC_MALLOC_LIMIT}" ] ; then
		append-flags "-DGC_MALLOC_LIMIT=${RUBY_GC_MALLOC_LIMIT}"
	fi

	# ipv6 hack, bug 168939. Needs --enable-ipv6.
	use ipv6 || myconf="${myconf} --with-lookup-order-hack=INET"

#	if use libedit; then
#		einfo "Using libedit to provide readline extension"
#		myconf="${myconf} --enable-libedit --with-readline"
#	elif use readline; then
#		einfo "Using readline to provide readline extension"
#		myconf="${myconf} --with-readline"
#	else
#		myconf="${myconf} --without-readline"
#	fi
	myconf="${myconf} $(use_with readline)"

	# Always disable tk because the module is no longer compatible with
	# stable tcl/tk: https://bugs.gentoo.org/show_bug.cgi?id=500894
	INSTALL="${EPREFIX}/usr/bin/install -c" econf \
		--program-suffix=${MY_SUFFIX} \
		--with-soname=ruby${MY_SUFFIX} \
		--enable-shared \
		--enable-pthread \
		--without-tk \
		$(use_enable socks5 socks) \
		$(use_enable doc install-doc) \
		--enable-ipv6 \
		$(use_enable debug) \
		$(use_with berkdb dbm) \
		$(use_with gdbm) \
		$(use_with ssl openssl) \
		$(use_with ncurses curses) \
		$(use_with yaml psych) \
		${myconf} \
		--with-readline-dir="${EPREFIX}"/usr \
		--enable-option-checking=no \
		|| die "econf failed"
}

src_compile() {
	emake V=1 EXTLDFLAGS="${LDFLAGS}" || die "emake failed"
}

src_test() {
	emake -j1 V=1 test || die "make test failed"

	elog "Ruby's make test has been run. Ruby also ships with a make check"
	elog "that cannot be run until after ruby has been installed."
	elog
	if use rubytests; then
		elog "You have enabled rubytests, so they will be installed to"
		elog "/usr/share/${PN}-${SLOT}/test. To run them you must be a user other"
		elog "than root, and you must place them into a writeable directory."
		elog "Then call: "
		elog
		elog "ruby${MY_SUFFIX} -C /location/of/tests runner.rb"
	else
		elog "Enable the rubytests USE flag to install the make check tests"
	fi
}

src_install() {
	# Ruby is involved in the install process, we don't want interference here.
	unset RUBYOPT

	local MINIRUBY=$(echo -e 'include Makefile\ngetminiruby:\n\t@echo $(MINIRUBY)'|make -f - getminiruby)

	LD_LIBRARY_PATH="${ED}/usr/$(get_libdir)${LD_LIBRARY_PATH+:}${LD_LIBRARY_PATH}"
	RUBYLIB="${S}:${ED}/usr/$(get_libdir)/ruby/${RUBYVERSION}"
	for d in $(find "${S}/ext" -type d) ; do
		RUBYLIB="${RUBYLIB}:$d"
	done
	export LD_LIBRARY_PATH RUBYLIB

	emake V=1 DESTDIR="${D}" install || die "make install failed"

	# Remove installed rubygems copy
	rm -r "${ED}/usr/$(get_libdir)/ruby/${RUBYVERSION}/rubygems" || die "rm rubygems failed"
	rm -r "${ED}/usr/$(get_libdir)/ruby/${RUBYVERSION}"/rdoc* || die "rm rdoc failed"
	rm -r "${ED}/usr/bin/"{ri,rdoc}"${MY_SUFFIX}" || die "rm rdoc bins failed"

	if use doc; then
		make DESTDIR="${D}" install-doc || die "make install-doc failed"
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r sample
	fi

	dodoc ChangeLog NEWS doc/NEWS* README* ToDo || die

	if use rubytests; then
		pushd test
		insinto /usr/share/${PN}-${SLOT}/test
		doins -r .
		popd
	fi
}

pkg_postinst() {
	if [[ ! -n $(readlink "${EROOT}"usr/bin/ruby) ]] ; then
		eselect ruby set ruby${MY_SUFFIX}
	fi

	elog
	elog "To switch between available Ruby profiles, execute as root:"
	elog "\teselect ruby set ruby(18|19|...)"
	elog
}

pkg_postrm() {
	eselect ruby cleanup
}
