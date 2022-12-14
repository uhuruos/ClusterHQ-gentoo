# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/allison/allison-2.0.3-r1.ebuild,v 1.14 2014/08/05 16:00:37 mrueg Exp $

EAPI=2
USE_RUBY="ruby19 jruby"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README"
RUBY_FAKEGEM_EXTRAINSTALL="cache"

inherit ruby-fakegem

DESCRIPTION="A modern, pretty RDoc template"
HOMEPAGE="http://fauna.github.com/fauna/allison/files/README.html"

LICENSE="AFL-3.0"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~s390 sparc x86 ~x86-solaris"
IUSE=""

all_ruby_install() {
	all_fakegem_install

	insinto /usr/share/doc/${PF}
	doins -r contrib
}
