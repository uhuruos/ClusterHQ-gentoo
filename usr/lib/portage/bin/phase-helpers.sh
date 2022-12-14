#!/home/core/gentoo/bin/bash
# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

export DESTTREE=/usr
export INSDESTTREE=""
export _E_EXEDESTTREE_=""
export _E_DOCDESTTREE_=""
export INSOPTIONS="-m0644"
export EXEOPTIONS="-m0755"
export LIBOPTIONS="-m0644"
export DIROPTIONS="-m0755"
export MOPREFIX=${PN}
# Do not compress files which are smaller than this (in bytes). #169260
export PORTAGE_DOCOMPRESS_SIZE_LIMIT="128"
declare -a PORTAGE_DOCOMPRESS=( /usr/share/{doc,info,man} )
declare -a PORTAGE_DOCOMPRESS_SKIP=( /usr/share/doc/${PF}/html )

into() {
	if [ "$1" == "/" ]; then
		export DESTTREE=""
	else
		export DESTTREE=$1
		if ! ___eapi_has_prefix_variables; then
			local ED=${D}
		fi
		if [ ! -d "${ED}${DESTTREE}" ]; then
			install -d "${ED}${DESTTREE}"
			local ret=$?
			if [[ $ret -ne 0 ]] ; then
				__helpers_die "${FUNCNAME[0]} failed"
				return $ret
			fi
		fi
	fi
}

insinto() {
	if [ "$1" == "/" ]; then
		export INSDESTTREE=""
	else
		export INSDESTTREE=$1
		if ! ___eapi_has_prefix_variables; then
			local ED=${D}
		fi
		if [ ! -d "${ED}${INSDESTTREE}" ]; then
			install -d "${ED}${INSDESTTREE}"
			local ret=$?
			if [[ $ret -ne 0 ]] ; then
				__helpers_die "${FUNCNAME[0]} failed"
				return $ret
			fi
		fi
	fi
}

exeinto() {
	if [ "$1" == "/" ]; then
		export _E_EXEDESTTREE_=""
	else
		export _E_EXEDESTTREE_="$1"
		if ! ___eapi_has_prefix_variables; then
			local ED=${D}
		fi
		if [ ! -d "${ED}${_E_EXEDESTTREE_}" ]; then
			install -d "${ED}${_E_EXEDESTTREE_}"
			local ret=$?
			if [[ $ret -ne 0 ]] ; then
				__helpers_die "${FUNCNAME[0]} failed"
				return $ret
			fi
		fi
	fi
}

docinto() {
	if [ "$1" == "/" ]; then
		export _E_DOCDESTTREE_=""
	else
		export _E_DOCDESTTREE_="$1"
		if ! ___eapi_has_prefix_variables; then
			local ED=${D}
		fi
		if [ ! -d "${ED}usr/share/doc/${PF}/${_E_DOCDESTTREE_}" ]; then
			install -d "${ED}usr/share/doc/${PF}/${_E_DOCDESTTREE_}"
			local ret=$?
			if [[ $ret -ne 0 ]] ; then
				__helpers_die "${FUNCNAME[0]} failed"
				return $ret
			fi
		fi
	fi
}

insopts() {
	export INSOPTIONS="$@"

	# `install` should never be called with '-s' ...
	has -s ${INSOPTIONS} && die "Never call insopts() with -s"
}

diropts() {
	export DIROPTIONS="$@"
}

exeopts() {
	export EXEOPTIONS="$@"

	# `install` should never be called with '-s' ...
	has -s ${EXEOPTIONS} && die "Never call exeopts() with -s"
}

libopts() {
	export LIBOPTIONS="$@"

	# `install` should never be called with '-s' ...
	has -s ${LIBOPTIONS} && die "Never call libopts() with -s"
}

docompress() {
	___eapi_has_docompress || die "'docompress' not supported in this EAPI"

	local f g
	if [[ $1 = "-x" ]]; then
		shift
		for f; do
			f=$(__strip_duplicate_slashes "${f}"); f=${f%/}
			[[ ${f:0:1} = / ]] || f="/${f}"
			for g in "${PORTAGE_DOCOMPRESS_SKIP[@]}"; do
				[[ ${f} = "${g}" ]] && continue 2
			done
			PORTAGE_DOCOMPRESS_SKIP[${#PORTAGE_DOCOMPRESS_SKIP[@]}]=${f}
		done
	else
		for f; do
			f=$(__strip_duplicate_slashes "${f}"); f=${f%/}
			[[ ${f:0:1} = / ]] || f="/${f}"
			for g in "${PORTAGE_DOCOMPRESS[@]}"; do
				[[ ${f} = "${g}" ]] && continue 2
			done
			PORTAGE_DOCOMPRESS[${#PORTAGE_DOCOMPRESS[@]}]=${f}
		done
	fi
}

useq() {
	has $EBUILD_PHASE prerm postrm || eqawarn \
		"QA Notice: The 'useq' function is deprecated (replaced by 'use')"
	use ${1}
}

usev() {
	if use ${1}; then
		echo "${1#!}"
		return 0
	fi
	return 1
}

if ___eapi_has_usex; then
	usex() {
		if use "$1"; then
			echo "${2-yes}$4"
		else
			echo "${3-no}$5"
		fi
		return 0
	}
fi

use() {
	local u=$1
	local found=0

	# if we got something like '!flag', then invert the return value
	if [[ ${u:0:1} == "!" ]] ; then
		u=${u:1}
		found=1
	fi

	if [[ $EBUILD_PHASE = depend ]] ; then
		# TODO: Add a registration interface for eclasses to register
		# any number of phase hooks, so that global scope eclass
		# initialization can by migrated to phase hooks in new EAPIs.
		# Example: add_phase_hook before pkg_setup $ECLASS_pre_pkg_setup
		#if [[ -n $EAPI ]] && ! has "$EAPI" 0 1 2 3 ; then
		#	die "use() called during invalid phase: $EBUILD_PHASE"
		#fi
		true

	# Make sure we have this USE flag in IUSE, but exempt binary
	# packages for API consumers like Entropy which do not require
	# a full profile with IUSE_IMPLICIT and stuff (see bug #456830).
	elif [[ -n $PORTAGE_IUSE && -n $EBUILD_PHASE &&
		-n $PORTAGE_INTERNAL_CALLER ]] ; then
		if [[ ! $u =~ $PORTAGE_IUSE ]] ; then
			if [[ ! ${EAPI} =~ ^(0|1|2|3|4|4-python|4-slot-abi)$ ]] ; then
				# This is only strict starting with EAPI 5, since implicit IUSE
				# is not well defined for earlier EAPIs (see bug #449708).
				die "USE Flag '${u}' not in IUSE for ${CATEGORY}/${PF}"
			fi
			eqawarn "QA Notice: USE Flag '${u}' not" \
				"in IUSE for ${CATEGORY}/${PF}"
		fi
	fi

	local IFS=$' \t\n' prev_shopts=$- ret
	set -f
	if has ${u} ${USE} ; then
		ret=${found}
	else
		ret=$((!found))
	fi
	[[ ${prev_shopts} == *f* ]] || set +f
	return ${ret}
}

use_with() {
	if [ -z "$1" ]; then
		echo "!!! use_with() called without a parameter." >&2
		echo "!!! use_with <USEFLAG> [<flagname> [value]]" >&2
		return 1
	fi

	if ___eapi_use_enable_and_use_with_support_empty_third_argument; then
		local UW_SUFFIX=${3+=$3}
	else
		local UW_SUFFIX=${3:+=$3}
	fi
	local UWORD=${2:-$1}

	if use $1; then
		echo "--with-${UWORD}${UW_SUFFIX}"
	else
		echo "--without-${UWORD}"
	fi
	return 0
}

use_enable() {
	if [ -z "$1" ]; then
		echo "!!! use_enable() called without a parameter." >&2
		echo "!!! use_enable <USEFLAG> [<flagname> [value]]" >&2
		return 1
	fi

	if ___eapi_use_enable_and_use_with_support_empty_third_argument; then
		local UE_SUFFIX=${3+=$3}
	else
		local UE_SUFFIX=${3:+=$3}
	fi
	local UWORD=${2:-$1}

	if use $1; then
		echo "--enable-${UWORD}${UE_SUFFIX}"
	else
		echo "--disable-${UWORD}"
	fi
	return 0
}

unpack() {
	local srcdir
	local x
	local y y_insensitive
	local suffix suffix_insensitive
	local myfail
	local eapi=${EAPI:-0}
	[ -z "$*" ] && die "Nothing passed to the 'unpack' command"

	for x in "$@"; do
		__vecho ">>> Unpacking ${x} to ${PWD}"
		suffix=${x##*.}
		suffix_insensitive=$(LC_ALL=C tr "[:upper:]" "[:lower:]" <<< "${suffix}")
		y=${x%.*}
		y=${y##*.}
		y_insensitive=$(LC_ALL=C tr "[:upper:]" "[:lower:]" <<< "${y}")

		if [[ ${x} == "./"* ]] ; then
			srcdir=""
		elif [[ ${x} == ${DISTDIR%/}/* ]] ; then
			die "Arguments to unpack() cannot begin with \${DISTDIR}."
		elif [[ ${x} == "/"* ]] ; then
			die "Arguments to unpack() cannot be absolute"
		else
			srcdir="${DISTDIR}/"
		fi
		[[ ! -s ${srcdir}${x} ]] && die "${x} does not exist"

		__unpack_tar() {
			if [[ ${y_insensitive} == tar ]] ; then
				if ___eapi_unpack_is_case_sensitive && \
					[[ tar != ${y} ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"secondary suffix '${y}' which is unofficially" \
						"supported with EAPI '${EAPI}'. Instead use 'tar'."
				fi
				$1 -c -- "$srcdir$x" | tar xof -
				__assert_sigpipe_ok "$myfail"
			else
				local cwd_dest=${x##*/}
				cwd_dest=${cwd_dest%.*}
				$1 -c -- "${srcdir}${x}" > "${cwd_dest}" || die "$myfail"
			fi
		}

		myfail="failure unpacking ${x}"
		case "${suffix_insensitive}" in
			tar)
				if ___eapi_unpack_is_case_sensitive && \
					[[ tar != ${suffix} ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'tar'."
				fi
				tar xof "$srcdir$x" || die "$myfail"
				;;
			tgz)
				if ___eapi_unpack_is_case_sensitive && \
					[[ tgz != ${suffix} ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'tgz'."
				fi
				tar xozf "$srcdir$x" || die "$myfail"
				;;
			tbz|tbz2)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " tbz tbz2 " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'tbz' or 'tbz2'."
				fi
				${PORTAGE_BUNZIP2_COMMAND:-${PORTAGE_BZIP2_COMMAND} -d} -c -- "$srcdir$x" | tar xof -
				__assert_sigpipe_ok "$myfail"
				;;
			zip|jar)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " ZIP zip jar " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'." \
						"Instead use 'ZIP', 'zip', or 'jar'."
				fi
				# unzip will interactively prompt under some error conditions,
				# as reported in bug #336285
				( set +x ; while true ; do echo n || break ; done ) | \
				unzip -qo "${srcdir}${x}" || die "$myfail"
				;;
			gz|z)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " gz z Z " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'gz', 'z', or 'Z'."
				fi
				__unpack_tar "gzip -d"
				;;
			bz2|bz)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " bz bz2 " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'bz' or 'bz2'."
				fi
				__unpack_tar "${PORTAGE_BUNZIP2_COMMAND:-${PORTAGE_BZIP2_COMMAND} -d}"
				;;
			7z)
				local my_output
				my_output="$(7z x -y "${srcdir}${x}")"
				if [ $? -ne 0 ]; then
					echo "${my_output}" >&2
					die "$myfail"
				fi
				;;
			rar)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " rar RAR " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'rar' or 'RAR'."
				fi
				unrar x -idq -o+ "${srcdir}${x}" || die "$myfail"
				;;
			lha|lzh)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " LHA LHa lha lzh " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'." \
						"Instead use 'LHA', 'LHa', 'lha', or 'lzh'."
				fi
				lha xfq "${srcdir}${x}" || die "$myfail"
				;;
			a)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " a " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'a'."
				fi
				ar x "${srcdir}${x}" || die "$myfail"
				;;
			deb)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " deb " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'deb'."
				fi
				# Unpacking .deb archives can not always be done with
				# `ar`.  For instance on AIX this doesn't work out.  If
				# we have `deb2targz` installed, prefer it over `ar` for
				# that reason.  We just make sure on AIX `deb2targz` is
				# installed.
				if type -P deb2targz > /dev/null; then
					y=${x##*/}
					local created_symlink=0
					if [ ! "$srcdir$x" -ef "$y" ] ; then
						# deb2targz always extracts into the same directory as
						# the source file, so create a symlink in the current
						# working directory if necessary.
						ln -sf "$srcdir$x" "$y" || die "$myfail"
						created_symlink=1
					fi
					deb2targz "$y" || die "$myfail"
					if [ $created_symlink = 1 ] ; then
						# Clean up the symlink so the ebuild
						# doesn't inadvertently install it.
						rm -f "$y"
					fi
					mv -f "${y%.deb}".tar.gz data.tar.gz || die "$myfail"
				else
					ar x "$srcdir$x" || die "$myfail"
				fi
				;;
			lzma)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " lzma " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'lzma'."
				fi
				__unpack_tar "lzma -d"
				;;
			xz)
				if ___eapi_unpack_is_case_sensitive && \
					[[ " xz " != *" ${suffix} "* ]] ; then
					eqawarn "QA Notice: unpack called with" \
						"suffix '${suffix}' which is unofficially supported" \
						"with EAPI '${EAPI}'. Instead use 'xz'."
				fi
				if ___eapi_unpack_supports_xz; then
					__unpack_tar "xz -d"
				else
					__vecho "unpack ${x}: file format not recognized. Ignoring."
				fi
				;;
			*)
				__vecho "unpack ${x}: file format not recognized. Ignoring."
				;;
		esac
	done
	# Do not chmod '.' since it's probably ${WORKDIR} and PORTAGE_WORKDIR_MODE
	# should be preserved.
	find . -mindepth 1 -maxdepth 1 ! -type l -print0 | \
		${XARGS} -0 chmod -fR a+rX,u+w,g-w,o-w
}

econf() {
	local x
	local pid=${BASHPID:-$(__bashpid)}

	if ! ___eapi_has_prefix_variables; then
		local EPREFIX=
	fi

	__hasg() {
		local x s=$1
		shift
		for x ; do [[ ${x} == ${s} ]] && echo "${x}" && return 0 ; done
		return 1
	}

	__hasgq() { __hasg "$@" >/dev/null ; }

	local phase_func=$(__ebuild_arg_to_phase "$EBUILD_PHASE")
	if [[ -n $phase_func ]] ; then
		if ! ___eapi_has_src_configure; then
			[[ $phase_func != src_compile ]] && \
				eqawarn "QA Notice: econf called in" \
					"$phase_func instead of src_compile"
		else
			[[ $phase_func != src_configure ]] && \
				eqawarn "QA Notice: econf called in" \
					"$phase_func instead of src_configure"
		fi
	fi

	: ${ECONF_SOURCE:=.}
	if [ -x "${ECONF_SOURCE}/configure" ]; then
		if [[ -n $CONFIG_SHELL && \
			"$(head -n1 "$ECONF_SOURCE/configure")" =~ ^'#!'[[:space:]]*/bin/sh([[:space:]]|$) ]] ; then
			# preserve timestamp, see bug #440304
			touch -r "${ECONF_SOURCE}/configure" "${ECONF_SOURCE}/configure._portage_tmp_.${pid}" || die
			sed -i \
				-e "1s:^#![[:space:]]*/bin/sh:#!$CONFIG_SHELL:" \
				"${ECONF_SOURCE}/configure" \
				|| die "Substition of shebang in '${ECONF_SOURCE}/configure' failed"
			touch -r "${ECONF_SOURCE}/configure._portage_tmp_.${pid}" "${ECONF_SOURCE}/configure" || die
			rm -f "${ECONF_SOURCE}/configure._portage_tmp_.${pid}"
		fi
		if [ -e "${EPREFIX}"/usr/share/gnuconfig/ ]; then
			find "${WORKDIR}" -type f '(' \
			-name config.guess -o -name config.sub ')' -print0 | \
			while read -r -d $'\0' x ; do
				__vecho " * econf: updating ${x/${WORKDIR}\/} with ${EPREFIX}/usr/share/gnuconfig/${x##*/}"
				# Make sure we do this atomically incase we're run in parallel. #487478
				cp -f "${EPREFIX}"/usr/share/gnuconfig/"${x##*/}" "${x}.${pid}"
				mv -f "${x}.${pid}" "${x}"
			done
		fi

		if ___eapi_econf_passes_--disable-dependency-tracking || ___eapi_econf_passes_--disable-silent-rules; then
			local conf_help=$("${ECONF_SOURCE}/configure" --help 2>/dev/null)

			if ___eapi_econf_passes_--disable-dependency-tracking; then
				case "${conf_help}" in
					*--disable-dependency-tracking*)
						set -- --disable-dependency-tracking "$@"
						;;
				esac
			fi

			if ___eapi_econf_passes_--disable-silent-rules; then
				case "${conf_help}" in
					*--disable-silent-rules*)
						set -- --disable-silent-rules "$@"
						;;
				esac
			fi
		fi

		# if the profile defines a location to install libs to aside from default, pass it on.
		# if the ebuild passes in --libdir, they're responsible for the conf_libdir fun.
		local CONF_LIBDIR LIBDIR_VAR="LIBDIR_${ABI}"
		if [[ -n ${ABI} && -n ${!LIBDIR_VAR} ]] ; then
			CONF_LIBDIR=${!LIBDIR_VAR}
		fi
		if [[ -n ${CONF_LIBDIR} ]] && ! __hasgq --libdir=\* "$@" ; then
			export CONF_PREFIX=$(__hasg --exec-prefix=\* "$@")
			[[ -z ${CONF_PREFIX} ]] && CONF_PREFIX=$(__hasg --prefix=\* "$@")
			: ${CONF_PREFIX:=${EPREFIX}/usr}
			CONF_PREFIX=${CONF_PREFIX#*=}
			[[ ${CONF_PREFIX} != /* ]] && CONF_PREFIX="/${CONF_PREFIX}"
			[[ ${CONF_LIBDIR} != /* ]] && CONF_LIBDIR="/${CONF_LIBDIR}"
			set -- --libdir="$(__strip_duplicate_slashes "${CONF_PREFIX}${CONF_LIBDIR}")" "$@"
		fi

		# Handle arguments containing quoted whitespace (see bug #457136).
		eval "local -a EXTRA_ECONF=(${EXTRA_ECONF})"

		set -- \
			--prefix="${EPREFIX}"/usr \
			${CBUILD:+--build=${CBUILD}} \
			--host=${CHOST} \
			${CTARGET:+--target=${CTARGET}} \
			--mandir="${EPREFIX}"/usr/share/man \
			--infodir="${EPREFIX}"/usr/share/info \
			--datadir="${EPREFIX}"/usr/share \
			--sysconfdir="${EPREFIX}"/etc \
			--localstatedir="${EPREFIX}"/var/lib \
			"$@" \
			"${EXTRA_ECONF[@]}"
		__vecho "${ECONF_SOURCE}/configure" "$@"

		if ! "${ECONF_SOURCE}/configure" "$@" ; then

			if [ -s config.log ]; then
				echo
				echo "!!! Please attach the following file when seeking support:"
				echo "!!! ${PWD}/config.log"
			fi
			die "econf failed"
		fi
	elif [ -f "${ECONF_SOURCE}/configure" ]; then
		die "configure is not executable"
	else
		die "no configure script found"
	fi
}

einstall() {
	# CONF_PREFIX is only set if they didn't pass in libdir above.
	local LOCAL_EXTRA_EINSTALL="${EXTRA_EINSTALL}"
	if ! ___eapi_has_prefix_variables; then
		local ED=${D}
	fi
	LIBDIR_VAR="LIBDIR_${ABI}"
	if [ -n "${ABI}" -a -n "${!LIBDIR_VAR}" ]; then
		CONF_LIBDIR="${!LIBDIR_VAR}"
	fi
	unset LIBDIR_VAR
	if [ -n "${CONF_LIBDIR}" ] && [ "${CONF_PREFIX:+set}" = set ]; then
		EI_DESTLIBDIR="${D}/${CONF_PREFIX}/${CONF_LIBDIR}"
		EI_DESTLIBDIR="$(__strip_duplicate_slashes "${EI_DESTLIBDIR}")"
		LOCAL_EXTRA_EINSTALL="libdir=${EI_DESTLIBDIR} ${LOCAL_EXTRA_EINSTALL}"
		unset EI_DESTLIBDIR
	fi

	if [ -f ./[mM]akefile -o -f ./GNUmakefile ] ; then
		if [ "${PORTAGE_DEBUG}" == "1" ]; then
			${MAKE:-make} -n prefix="${ED}usr" \
				datadir="${ED}usr/share" \
				infodir="${ED}usr/share/info" \
				localstatedir="${ED}var/lib" \
				mandir="${ED}usr/share/man" \
				sysconfdir="${ED}etc" \
				${LOCAL_EXTRA_EINSTALL} \
				${MAKEOPTS} ${EXTRA_EMAKE} -j1 \
				"$@" install
		fi
		${MAKE:-make} prefix="${ED}usr" \
			datadir="${ED}usr/share" \
			infodir="${ED}usr/share/info" \
			localstatedir="${ED}var/lib" \
			mandir="${ED}usr/share/man" \
			sysconfdir="${ED}etc" \
			${LOCAL_EXTRA_EINSTALL} \
			${MAKEOPTS} ${EXTRA_EMAKE} -j1 \
			"$@" install || die "einstall failed"
	else
		die "no Makefile found"
	fi
}

__eapi0_pkg_nofetch() {
	[ -z "${SRC_URI}" ] && return

	elog "The following are listed in SRC_URI for ${PN}:"
	local x
	for x in $(echo ${SRC_URI}); do
		elog "   ${x}"
	done
}

__eapi0_src_unpack() {
	[[ -n ${A} ]] && unpack ${A}
}

__eapi0_src_compile() {
	if [ -x ./configure ] ; then
		econf
	fi
	__eapi2_src_compile
}

__eapi0_src_test() {
	# Since we don't want emake's automatic die
	# support (EAPI 4 and later), and we also don't
	# want the warning messages that it produces if
	# we call it in 'nonfatal' mode, we use emake_cmd
	# to emulate the desired parts of emake behavior.
	local emake_cmd="${MAKE:-make} ${MAKEOPTS} ${EXTRA_EMAKE}"
	local internal_opts=
	if ___eapi_default_src_test_disables_parallel_jobs; then
		internal_opts+=" -j1"
	fi
	if $emake_cmd ${internal_opts} check -n &> /dev/null; then
		__vecho ">>> Test phase [check]: ${CATEGORY}/${PF}"
		$emake_cmd ${internal_opts} check || \
			die "Make check failed. See above for details."
	elif $emake_cmd ${internal_opts} test -n &> /dev/null; then
		__vecho ">>> Test phase [test]: ${CATEGORY}/${PF}"
		$emake_cmd ${internal_opts} test || \
			die "Make test failed. See above for details."
	else
		__vecho ">>> Test phase [none]: ${CATEGORY}/${PF}"
	fi
}

__eapi1_src_compile() {
	__eapi2_src_configure
	__eapi2_src_compile
}

__eapi2_src_configure() {
	if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
		econf
	fi
}

__eapi2_src_compile() {
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		emake || die "emake failed"
	fi
}

__eapi4_src_install() {
	if [[ -f Makefile || -f GNUmakefile || -f makefile ]] ; then
		emake DESTDIR="${D}" install
	fi

	if ! declare -p DOCS &>/dev/null ; then
		local d
		for d in README* ChangeLog AUTHORS NEWS TODO CHANGES \
				THANKS BUGS FAQ CREDITS CHANGELOG ; do
			[[ -s "${d}" ]] && dodoc "${d}"
		done
	elif [[ $(declare -p DOCS) == "declare -a "* ]] ; then
		dodoc "${DOCS[@]}"
	else
		dodoc ${DOCS}
	fi
}

# @FUNCTION: has_version
# @USAGE: [--host-root] <DEPEND ATOM>
# @DESCRIPTION:
# Return true if given package is installed. Otherwise return false.
# Callers may override the ROOT variable in order to match packages from an
# alternative ROOT.
has_version() {

	local atom eroot host_root=false root=${ROOT}
	if [[ $1 == --host-root ]] ; then
		host_root=true
		shift
	fi
	atom=$1
	shift
	[ $# -gt 0 ] && die "${FUNCNAME[0]}: unused argument(s): $*"

	if ${host_root} ; then
		if ! ___eapi_best_version_and_has_version_support_--host-root; then
			die "${FUNCNAME[0]}: option --host-root is not supported with EAPI ${EAPI}"
		fi
		root=/
	fi

	if ___eapi_has_prefix_variables; then
		# [[ ${root} == / ]] would be ambiguous here,
		# since both prefixes can share root=/ while
		# having different EPREFIX offsets.
		if ${host_root} ; then
			eroot=${root%/}${PORTAGE_OVERRIDE_EPREFIX}/
		else
			eroot=${root%/}${EPREFIX}/
		fi
	else
		eroot=${root}
	fi
	if [[ -n $PORTAGE_IPC_DAEMON ]] ; then
		"$PORTAGE_BIN_PATH"/ebuild-ipc has_version "${eroot}" "${atom}"
	else
		"${PORTAGE_BIN_PATH}/ebuild-helpers/portageq" has_version "${eroot}" "${atom}"
	fi
	local retval=$?
	case "${retval}" in
		0|1)
			return ${retval}
			;;
		2)
			die "${FUNCNAME[0]}: invalid atom: ${atom}"
			;;
		*)
			if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
				die "${FUNCNAME[0]}: unexpected ebuild-ipc exit code: ${retval}"
			else
				die "${FUNCNAME[0]}: unexpected portageq exit code: ${retval}"
			fi
			;;
	esac
}

# @FUNCTION: best_version
# @USAGE: [--host-root] <DEPEND ATOM>
# @DESCRIPTION:
# Returns the best/most-current match.
# Callers may override the ROOT variable in order to match packages from an
# alternative ROOT.
best_version() {

	local atom eroot host_root=false root=${ROOT}
	if [[ $1 == --host-root ]] ; then
		host_root=true
		shift
	fi
	atom=$1
	shift
	[ $# -gt 0 ] && die "${FUNCNAME[0]}: unused argument(s): $*"

	if ${host_root} ; then
		if ! ___eapi_best_version_and_has_version_support_--host-root; then
			die "${FUNCNAME[0]}: option --host-root is not supported with EAPI ${EAPI}"
		fi
		root=/
	fi

	if ___eapi_has_prefix_variables; then
		# [[ ${root} == / ]] would be ambiguous here,
		# since both prefixes can share root=/ while
		# having different EPREFIX offsets.
		if ${host_root} ; then
			eroot=${root%/}${PORTAGE_OVERRIDE_EPREFIX}/
		else
			eroot=${root%/}${EPREFIX}/
		fi
	else
		eroot=${root}
	fi
	if [[ -n $PORTAGE_IPC_DAEMON ]] ; then
		"$PORTAGE_BIN_PATH"/ebuild-ipc best_version "${eroot}" "${atom}"
	else
		"${PORTAGE_BIN_PATH}/ebuild-helpers/portageq" best_version "${eroot}" "${atom}"
	fi
	local retval=$?
	case "${retval}" in
		0|1)
			return ${retval}
			;;
		2)
			die "${FUNCNAME[0]}: invalid atom: ${atom}"
			;;
		*)
			if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
				die "${FUNCNAME[0]}: unexpected ebuild-ipc exit code: ${retval}"
			else
				die "${FUNCNAME[0]}: unexpected portageq exit code: ${retval}"
			fi
			;;
	esac
}

if ___eapi_has_master_repositories; then
	master_repositories() {
		local output repository=$1 retval
		shift
		[[ $# -gt 0 ]] && die "${FUNCNAME[0]}: unused argument(s): $*"

		if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
			"${PORTAGE_BIN_PATH}/ebuild-ipc" master_repositories "${EROOT}" "${repository}"
		else
			output=$("${PORTAGE_BIN_PATH}/ebuild-helpers/portageq" master_repositories "${EROOT}" "${repository}")
		fi
		retval=$?
		[[ -n ${output} ]] && echo "${output}"
		case "${retval}" in
			0|1)
				return ${retval}
				;;
			2)
				die "${FUNCNAME[0]}: invalid repository: ${repository}"
				;;
			*)
				if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
					die "${FUNCNAME[0]}: unexpected ebuild-ipc exit code: ${retval}"
				else
					die "${FUNCNAME[0]}: unexpected portageq exit code: ${retval}"
				fi
				;;
		esac
	}
fi

if ___eapi_has_repository_path; then
	repository_path() {
		local output repository=$1 retval
		shift
		[[ $# -gt 0 ]] && die "${FUNCNAME[0]}: unused argument(s): $*"

		if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
			"${PORTAGE_BIN_PATH}/ebuild-ipc" repository_path "${EROOT}" "${repository}"
		else
			output=$("${PORTAGE_BIN_PATH}/ebuild-helpers/portageq" get_repo_path "${EROOT}" "${repository}")
		fi
		retval=$?
		[[ -n ${output} ]] && echo "${output}"
		case "${retval}" in
			0|1)
				return ${retval}
				;;
			2)
				die "${FUNCNAME[0]}: invalid repository: ${repository}"
				;;
			*)
				if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
					die "${FUNCNAME[0]}: unexpected ebuild-ipc exit code: ${retval}"
				else
					die "${FUNCNAME[0]}: unexpected portageq exit code: ${retval}"
				fi
				;;
		esac
	}
fi

if ___eapi_has_available_eclasses; then
	available_eclasses() {
		local output repository=${PORTAGE_REPO_NAME} retval
		[[ $# -gt 0 ]] && die "${FUNCNAME[0]}: unused argument(s): $*"

		if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
			"${PORTAGE_BIN_PATH}/ebuild-ipc" available_eclasses "${EROOT}" "${repository}"
		else
			output=$("${PORTAGE_BIN_PATH}/ebuild-helpers/portageq" available_eclasses "${EROOT}" "${repository}")
		fi
		retval=$?
		[[ -n ${output} ]] && echo "${output}"
		case "${retval}" in
			0|1)
				return ${retval}
				;;
			2)
				die "${FUNCNAME[0]}: invalid repository: ${repository}"
				;;
			*)
				if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
					die "${FUNCNAME[0]}: unexpected ebuild-ipc exit code: ${retval}"
				else
					die "${FUNCNAME[0]}: unexpected portageq exit code: ${retval}"
				fi
				;;
		esac
	}
fi

if ___eapi_has_eclass_path; then
	eclass_path() {
		local eclass=$1 output repository=${PORTAGE_REPO_NAME} retval
		shift
		[[ $# -gt 0 ]] && die "${FUNCNAME[0]}: unused argument(s): $*"

		if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
			"${PORTAGE_BIN_PATH}/ebuild-ipc" eclass_path "${EROOT}" "${repository}" "${eclass}"
		else
			output=$("${PORTAGE_BIN_PATH}/ebuild-helpers/portageq" eclass_path "${EROOT}" "${repository}" "${eclass}")
		fi
		retval=$?
		[[ -n ${output} ]] && echo "${output}"
		case "${retval}" in
			0|1)
				return ${retval}
				;;
			2)
				die "${FUNCNAME[0]}: invalid repository: ${repository}"
				;;
			*)
				if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
					die "${FUNCNAME[0]}: unexpected ebuild-ipc exit code: ${retval}"
				else
					die "${FUNCNAME[0]}: unexpected portageq exit code: ${retval}"
				fi
				;;
		esac
	}
fi

if ___eapi_has_license_path; then
	license_path() {
		local license=$1 output repository=${PORTAGE_REPO_NAME} retval
		shift
		[[ $# -gt 0 ]] && die "${FUNCNAME[0]}: unused argument(s): $*"

		if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
			"${PORTAGE_BIN_PATH}/ebuild-ipc" license_path "${EROOT}" "${repository}" "${license}"
		else
			output=$("${PORTAGE_BIN_PATH}/ebuild-helpers/portageq" license_path "${EROOT}" "${repository}" "${license}")
		fi
		retval=$?
		[[ -n ${output} ]] && echo "${output}"
		case "${retval}" in
			0|1)
				return ${retval}
				;;
			2)
				die "${FUNCNAME[0]}: invalid repository: ${repository}"
				;;
			*)
				if [[ -n ${PORTAGE_IPC_DAEMON} ]]; then
					die "${FUNCNAME[0]}: unexpected ebuild-ipc exit code: ${retval}"
				else
					die "${FUNCNAME[0]}: unexpected portageq exit code: ${retval}"
				fi
				;;
		esac
	}
fi

if ___eapi_has_package_manager_build_user; then
	package_manager_build_user() {
		echo "${PORTAGE_BUILD_USER}"
	}
fi

if ___eapi_has_package_manager_build_group; then
	package_manager_build_group() {
		echo "${PORTAGE_BUILD_GROUP}"
	}
fi
