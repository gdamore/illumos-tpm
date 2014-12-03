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
# uts/intel/Makefile
#
# Copyright (c) 1999, 2010, Oracle and/or its affiliates. All rights reserved.
#
#	This makefile drives the production of all implementation architecture
#	independent modules for Intel processors.

UTSBASE = ..

include Makefile.intel

LINT_KMODS_X1	= $(LINT_KMODS:nsmb=)
LINT_KMODS_X2	= $(LINT_KMODS_X1:smbfs=)
LINT_KMODLIBS	= $(LINT_KMODS_X2:e1000g=)
LINT_LIBS	= $(LINT_LIB) $(GEN_LINT_LIB) \
		  $(LINT_KMODLIBS:%=$(LINT_LIB_DIR)/llib-l%.ln)

#
#
def		:=	TARGET= def
def.prereq	:=	TARGET= def
all		:=	TARGET= all
all.prereq	:=	TARGET= all
install		:=	TARGET= install
install.prereq	:=	TARGET= all
clean		:=	TARGET= clean
clobber		:=	TARGET= clobber
lint		:=	TARGET= lint
lint.prereq	:=	TARGET= lint
modlintlib	:=	TARGET= modlintlib
modlist		:=	TARGET= modlist
modlist		:=	NO_STATE= -K $$MODSTATE$$$$
clean.lint	:=	TARGET= clean.lint
check		:=	TARGET= check
install_h	:=	TARGET= install_h
install_h.prereq	:=	TARGET= install_h

.KEEP_STATE:

.PARALLEL:	$(PARALLEL_KMODS) $(LINT_DEPS)

def all install clean clobber modlist: $(KMODS)

clobber: clobber.targ

#
# Nothing to do for any other prerequisite targets.
#
%.prereq:

modlintlib clean.lint: $(LINT_KMODS)

$(KMODS) $(SUBDIRS):	FRC
	@cd $@; pwd; $(MAKE) $(NO_STATE) $(TARGET)

install_h check:	FRC

#
#	Full kernel lint target.
#
LINT_TARGET	= globallint

# workaround for multiply defined errors
globallint:
	@echo "Global lint not supported."

lint:	modlintlib .WAIT $(LINT_DEPS)

include ../Makefile.targ
