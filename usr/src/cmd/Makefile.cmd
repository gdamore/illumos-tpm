#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright (c) 1989, 2010, Oracle and/or its affiliates. All rights reserved.
#
# Definitions common to command source.
#
# include global definitions; SRC should be defined in the shell.
# SRC is needed until RFE 1026993 is implemented.

include $(SRC)/Makefile.master

LN=		ln
SH=		sh
ECHO=		echo
MKDIR=		mkdir
TOUCH=		touch

FILEMODE=	0555
LIBFILEMODE=	0444
XPG4=		$(XPG4PROG:%=%.xpg4)
XPG6=		$(XPG6PROG:%=%.xpg6)

ROOTBIN=		$(ROOT)/usr/bin
ROOTLIB=		$(ROOT)/usr/lib
ROOTLIBSVCBIN=		$(ROOT)/lib/svc/bin
ROOTLIBSVCMETHOD=	$(ROOT)/lib/svc/method
ROOTLIBZONES=		$(ROOT)/lib/zones

ROOTSHLIB=	$(ROOT)/usr/share/lib

ROOTSHLIBCCS=	$(ROOTSHLIB)/ccs
ROOTSBIN=	$(ROOT)/sbin
ROOTUSRSBIN=	$(ROOT)/usr/sbin
ROOTETC=	$(ROOT)/etc

ROOTXPG4=	$(ROOT)/usr/xpg4
ROOTXPG4BIN=	$(ROOT)/usr/xpg4/bin
ROOTXPG4BIN32=	$(ROOTXPG4BIN)/$(MACH32)
ROOTXPG4BIN64=	$(ROOTXPG4BIN)/$(MACH64)
ROOTXPG6=	$(ROOT)/usr/xpg6
ROOTXPG6BIN=	$(ROOT)/usr/xpg6/bin
ROOTBIN32=	$(ROOTBIN)/$(MACH32)
ROOTBIN64=	$(ROOTBIN)/$(MACH64)
ROOTCMDDIR64=	$(ROOTCMDDIR)/$(MACH64)
ROOTLIB64=	$(ROOTLIB)/$(MACH64)
ROOTUSRSBIN32=	$(ROOTUSRSBIN)/$(MACH32)
ROOTUSRSBIN64=	$(ROOTUSRSBIN)/$(MACH64)
ROOTMAN=	$(ROOT)/usr/share/man
ROOTMAN1=	$(ROOTMAN)/man1
ROOTMAN1M=	$(ROOTMAN)/man1m
ROOTMAN3=	$(ROOTMAN)/man3


#
# Like ROOTLIBDIR in $(SRC)/Makefile.lib, any lower-level Makefiles that
# put their binaries in a non-standard location should reset this and use
# $(ROOTCMD) in their `install' target. By default we set this to a bogus
# value so that it will not conflict with any of the other values already
# defined in this Makefile.
#
ROOTCMDDIR=	$(ROOT)/__nonexistent_directory__

ISAEXEC=	$(ROOT)/usr/lib/isaexec
PLATEXEC=	$(ROOT)/usr/lib/platexec

LDLIBS =	$(LDLIBS.cmd)

LDFLAGS.cmd = \
	$(BDIRECT) $(ENVLDFLAGS1) $(ENVLDFLAGS2) $(ENVLDFLAGS3) \
	$(MAPFILE.NES:%=-M%) $(MAPFILE.PGA:%=-M%) $(MAPFILE.NED:%=-M%)

LDFLAGS =	$(LDFLAGS.cmd)

LINTFLAGS=	-axsm
LINTFLAGS64=	-axsm -m64
LINTOUT=	lint.out

ROOTPROG=	$(PROG:%=$(ROOTBIN)/%)
ROOTCMD=	$(PROG:%=$(ROOTCMDDIR)/%)
ROOTSHFILES=	$(SHFILES:%=$(ROOTBIN)/%)
ROOTLIBPROG=	$(PROG:%=$(ROOTLIB)/%)
ROOTLIBSHFILES= $(SHFILES:%=$(ROOTLIB)/%)
ROOTSHLIBPROG=	$(PROG:%=$(ROOTSHLIB)/%)
ROOTSBINPROG=	$(PROG:%=$(ROOTSBIN)/%)
ROOTUSRSBINPROG=$(PROG:%=$(ROOTUSRSBIN)/%)
ROOTUSRSBINSCRIPT=$(SCRIPT:%=$(ROOTUSRSBIN)/%)
ROOTETCPROG=	$(PROG:%=$(ROOTETC)/%)
ROOTXPG4PROG=	$(XPG4PROG:%=$(ROOTXPG4BIN)/%)
ROOTXPG4PROG32=	$(XPG4PROG:%=$(ROOTXPG4BIN32)/%)
ROOTXPG4PROG64=	$(XPG4PROG:%=$(ROOTXPG4BIN64)/%)
ROOTXPG6PROG=	$(XPG6PROG:%=$(ROOTXPG6BIN)/%)
ROOTPROG64=	$(PROG:%=$(ROOTBIN64)/%)
ROOTPROG32=	$(PROG:%=$(ROOTBIN32)/%)
ROOTCMD64=	$(PROG:%=$(ROOTCMDDIR64)/%)
ROOTUSRSBINPROG32=	$(PROG:%=$(ROOTUSRSBIN32)/%)
ROOTUSRSBINPROG64=	$(PROG:%=$(ROOTUSRSBIN64)/%)
ROOTMAN1FILES=	$(MAN1FILES:%=$(ROOTMAN1)/%)
$(ROOTMAN1FILES) := FILEMODE= 444
ROOTMAN1MFILES=	$(MAN1MFILES:%=$(ROOTMAN1M)/%)
$(ROOTMAN1MFILES) := FILEMODE= 444
ROOTMAN3FILES=	$(MAN3FILES:%=$(ROOTMAN3)/%)
$(ROOTMAN3FILES) := FILEMODE= 444

ROOTETCDEFAULT=	$(ROOTETC)/default
ROOTETCDEFAULTFILES=	$(DEFAULTFILES:%.dfl=$(ROOTETCDEFAULT)/%)
$(ROOTETCDEFAULTFILES) :=	FILEMODE = 0644

#
# Directories for smf(5) service manifests and profiles.
#
ROOTSVC=			$(ROOT)/lib/svc
ROOTETCSVC=			$(ROOT)/etc/svc

ROOTSVCMANIFEST=		$(ROOTSVC)/manifest
ROOTSVCMILESTONE=		$(ROOTSVCMANIFEST)/milestone
ROOTSVCDEVICE=			$(ROOTSVCMANIFEST)/device
ROOTSVCSYSTEM=			$(ROOTSVCMANIFEST)/system
ROOTSVCSYSTEMDEVICE=		$(ROOTSVCSYSTEM)/device
ROOTSVCSYSTEMFILESYSTEM=	$(ROOTSVCSYSTEM)/filesystem
ROOTSVCNETWORK=			$(ROOTSVCMANIFEST)/network
ROOTSVCPLATFORM=		$(ROOTSVCMANIFEST)/platform
ROOTSVCAPPLICATION=		$(ROOTSVCMANIFEST)/application
ROOTSVCPROFILE=			$(ROOTETCSVC)/profile
ROOTSVCAPPLICATION=		$(ROOTSVCMANIFEST)/application

#
# Commands Makefiles delivering a manifest are expected to define MANIFEST.
#
# Like ROOTCMDDIR, any lower-level Makefiles that put their manifests in a
# subdirectory of the manifest directories listed above should reset
# ROOTMANIFESTDIR and use it in their `install' target. By default we set this
# to a bogus value so that it will not conflict with any of the other values
# already  defined in this Makefile.
#
# The manifest validation of the $SRC/cmd check target is also derived from a
# valid MANIFEST setting.
#
ROOTMANIFESTDIR=	$(ROOTSVCMANIFEST)/__nonexistent_directory__
ROOTMANIFEST=		$(MANIFEST:%=$(ROOTMANIFESTDIR)/%)
CHKMANIFEST=		$(MANIFEST:%.xml=%.xmlchk)

# Manifests cannot be checked in parallel, because we are using the global
# repository that is in $(SRC)/cmd/svc/seed/global.db.  This is a
# repository that is built from the manifests in this workspace, whereas
# the build machine's repository may be out of sync with these manifests.
# Because we are using a private repository, svccfg-native must start up a
# private copy of configd-native.  We cannot have multiple copies of
# configd-native trying to access global.db simultaneously.

.NO_PARALLEL:	$(CHKMANIFEST)

#
# For installing "starter scripts" of services
#

ROOTSVCMETHOD=		$(SVCMETHOD:%=$(ROOTLIBSVCMETHOD)/%)

ROOTSVCBINDIR=		$(ROOTLIBSVCBIN)/__nonexistent_directory__
ROOTSVCBIN= 		$(SVCBIN:%=$(ROOTSVCBINDIR)/%)

#

# For programs that are installed in the root filesystem,
# build $(ROOTFS_PROG) rather than $(PROG)
$(ROOTFS_PROG) := LDFLAGS += -Wl,-I/lib/ld.so.1

$(ROOTBIN)/%: %
	$(INS.file)

$(ROOTLIB)/%: %
	$(INS.file)

$(ROOTBIN64)/%: %
	$(INS.file)

$(ROOTLIB64)/%: %
	$(INS.file)

$(ROOTBIN32)/%: %
	$(INS.file)

$(ROOTSHLIB)/%: %
	$(INS.file)

$(ROOTSBIN)/%: %
	$(INS.file)

$(ROOTUSRSBIN)/%: %
	$(INS.file)

$(ROOTUSRSBIN32)/%: %
	$(INS.file)

$(ROOTUSRSBIN64)/%: %
	$(INS.file)

$(ROOTLIBSVCMETHOD)/%: %
	$(INS.file)

$(ROOTETC)/%: %
	$(INS.file)

$(ROOTETCDEFAULT)/%:	%.dfl
	$(INS.rename)

$(ROOTXPG4BIN)/%: %.xpg4
	$(INS.rename)

$(ROOTXPG4BIN32)/%: %.xpg4
	$(INS.rename)

$(ROOTXPG4BIN64)/%: %.xpg4
	$(INS.rename)

$(ROOTXPG6BIN)/%: %.xpg6
	$(INS.rename)

# Install rule for gprof, yacc, and lex dependency files
$(ROOTSHLIBCCS)/%: ../common/%
	$(INS.file)

$(ROOTCCSBINLINKDIR)/%: %
	$(INS.ccsbinlink)

$(ROOTCCSBINLINKDIR64)/%: %
	$(INS.ccsbinlink64)

$(ROOTMAN1)/%: %.sunman
	$(INS.rename)

$(ROOTMAN1M)/%: %.sunman
	$(INS.rename)

$(ROOTMAN3)/%: %.sunman
	$(INS.rename)

# build rule for statically linked programs with single source file.
%.static: %.c
	$(LINK.c) -o $@ $< $(LDLIBS)
	$(POST_PROCESS)

%.xpg4: %.c
	$(LINK.c) -o $@ $< $(LDLIBS)
	$(POST_PROCESS)

%.xpg6: %.c
	$(LINK.c) -o $@ $< $(LDLIBS)
	$(POST_PROCESS)

# Define the majority text domain in this directory.
TEXT_DOMAIN= ILLUMOS_TPM

CLOBBERFILES += $(XPG4) $(XPG6) $(DCFILE)

# This flag is for programs which should not build a 32-bit binary
sparc_64ONLY= $(POUND_SIGN)
64ONLY=	 $($(MACH)_64ONLY)
