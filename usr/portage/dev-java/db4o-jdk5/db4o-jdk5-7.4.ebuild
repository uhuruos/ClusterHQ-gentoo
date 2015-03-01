# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/db4o-jdk5/db4o-jdk5-7.4.ebuild,v 1.3 2009/07/01 21:16:53 maekke Exp $

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Core files for the object database for java"
HOMEPAGE="http://www.db4o.com"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE=""

COMMON_DEPEND="dev-java/db4o-jdk11
		dev-java/db4o-jdk12"
RDEPEND=">=virtual/jre-1.5
	${COMMON_DEPEND}"
DEPEND=">=virtual/jdk-1.5
	${COMMON_DEPEND}"

EANT_GENTOO_CLASSPATH="db4o-jdk11 db4o-jdk12"

src_install() {
	java-pkg_dojar ${PN}.jar
	use doc && java-pkg_dojavadoc docs
	use source && java-pkg_dosrc {core,plugins}/src/com
}