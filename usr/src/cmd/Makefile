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

# Copyright (c) 1989, 2010, Oracle and/or its affiliates. All rights reserved.
# Copyright 2010 Nexenta Systems, Inc.  All rights reserved.
# Copyright (c) 2012 Joyent, Inc.  All rights reserved.
# Copyright (c) 2012 by Delphix. All rights reserved.
# Copyright (c) 2013 DEY Storage Systems, Inc. All rights reserved.
# Copyright 2014 Garrett D'Amore <garrett@damore.org>

include ../Makefile.master

#
#	Note that the commands 'lp', and 'perl' are first in
#	the list, violating alphabetical order.  This is because they are very
#	long-running and should be given the most wall-clock time for a
#	parallel build.
#
#	Commands in the FIRST_SUBDIRS list are built before starting the build
#	of other commands.  Currently this includes only 'isaexec' and
#	'platexec'.  This is necessary because $(ROOT)/usr/lib/isaexec or
#	$(ROOT)/usr/lib/platexec must exist when some other commands are built
#	because their 'make install' creates a hard link to one of them.
#
#	Commands are listed one per line so that TeamWare can auto-merge most
#	changes.
#

FIRST_SUBDIRS=

COMMON_SUBDIRS=	tpmadm

i386_SUBDIRS=

sparc_SUBDIRS=

MSGSUBDIRS=	tpmadm

sparc_MSGSUBDIRS=

i386_MSGSUBDIRS=

#
# commands that use dcgettext for localized time, LC_TIME
#
DCSUBDIRS=

all :=		TARGET = all
install :=	TARGET = install
clean :=	TARGET = clean
clobber :=	TARGET = clobber
lint :=		TARGET = lint
_msg :=		TARGET = _msg
_dc :=		TARGET = _dc

.KEEP_STATE:

SUBDIRS = $(COMMON_SUBDIRS) $($(MACH)_SUBDIRS)

.PARALLEL:	$(SUBDIRS) $(MSGSUBDIRS)

all install clean clobber lint check: $(FIRST_SUBDIRS) .WAIT $(SUBDIRS)

#
# The .WAIT directive works around an apparent bug in parallel make.
# Evidently make was getting the target _msg vs. _dc confused under
# some level of parallelization, causing some of the _dc objects
# not to be built.
#
_msg: $(MSGSUBDIRS) $($(MACH)_MSGSUBDIRS) .WAIT _dc

_dc: $(DCSUBDIRS)

$(FIRST_SUBDIRS) $(SUBDIRS): FRC
	cd $@; pwd; $(MAKE) $(TARGET)

FRC:
