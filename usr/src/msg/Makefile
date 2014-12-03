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
# Copyright 2014 Garrett D'Amore <garrett@damore.org>
# Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#

include ../Makefile.master

ROOTDIR=$(ROOT)/usr/lib/locale/C
ROOTMSGDIR=$(ROOTDIR)/LC_MESSAGES

#
# These files either need no build rules, because they're under SCM
# in the current working directory, or they have explicit build rules
# that aren't handled by the $(MSGDIRFILES_REMOTE) rule below.
#
MSGDIRFILES_LOCAL=

#
# These files live somewhere else in the build tree (ie not in the
# directory usr/src/msg).  Each entry here should be accompanied by an
# explicit action telling where the file lives.  That action should
# consist only of a dependency, but no action--the action is supplied
# by the $(MSGDIRFILES_REMOTE) rule below.
#
MSGDIRFILES_REMOTE= 

MSGDIRFILES= $(MSGDIRFILES_LOCAL) $(MSGDIRFILES_REMOTE)

ROOTMSGDIRFILES=$(MSGDIRFILES:%=$(ROOTMSGDIR)/%)

PO_LABEL=' The following lines are contents of '

.KEEP_STATE:

all: $(MSGDIRFILES)

install: all _msg

clobber:
	$(RM) $(MSGDIRFILES_REMOTE)

#
# The _msg target gathers the output of the top-level _msg target into
# text-domain-specific message files under the ROOTMSGDIR for packaging.
#

$(ROOTMSGDIR):
	$(INS.dir)

$(ROOTMSGDIR)/%: $(ROOTMSGDIR) %
	$(INS.file)

$(MSGDIRFILES_REMOTE):
	$(RM) $@; $(CP) $? $@

_msg: _msg_LC_MESSAGES

_msg_LC_MESSAGES: $(ROOTMSGDIR) .WAIT $(ROOTMSGDIRFILES) FRC
	@[ -d $(MSGROOT) ] || $(ECHO) "need to build _msg in $(SRC)"
	@(cd $(MSGROOT); \
	for d in [A-KM-Z]*;\
	do \
		[ -d $$d ] || continue; \
		x="`$(ECHO) $$d/*.po`"; \
		y="$$d/"'*.po'; \
		$(RM) $(ROOTMSGDIR)/$$d.po; \
		if test "$$x" != "$$y"; then \
		for f in $$d/*.po; \
		do \
			$(ECHO) '#'$(PO_LABEL)$$f >> $(ROOTMSGDIR)/$$d.po; \
			$(SED) -e '/^# msg/d' -e '/^domain/d' $$f >> \
			    $(ROOTMSGDIR)/$$d.po; \
		done; \
		$(CHMOD) $(FILEMODE) $(ROOTMSGDIR)/$$d.po; \
		fi; \
		x="`$(ECHO) $$d/*.msg`"; \
		y="$$d/"'*.msg'; \
		if test "$$x" != "$$y"; then \
		for f in $$d/*.msg; \
		do \
			x="`basename $$f`"; \
			$(RM) $(ROOTMSGDIR)/$$x; \
			$(CP) $$f $(ROOTMSGDIR); \
			$(CHMOD) $(FILEMODE) $(ROOTMSGDIR)/$$x; \
		done; \
		fi; \
	done)

FRC:
