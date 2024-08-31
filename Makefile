#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/email-bulk-sender
DATA_DIR=$(DESTDIR)$(PREFIX)/share/email-bulk-sender
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard email-bulk-sender/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-email-bulk-sender install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-email-bulk-sender:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 email-bulk-sender/email-bulk-sender "$(BIN_DIR)"

.PHONY: check install install-doc install-displayctl shellcheck
