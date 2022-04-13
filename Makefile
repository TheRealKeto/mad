INSTALL    ?= install
PREFIX     ?= /usr/local
COMPLETION := $(PREFIX)/share/bash-completion/completions
VERSION    := 0.4.1-1

ifeq ($(shell uname),Linux)
COMPLETION := /etc/bash_completion.d
endif

all: install

install:
	$(INSTALL) -Dm0755 bin/mad $(DESTDIR)$(PREFIX)/bin/mad
	sed -i "s|@MAD_VERSION@|$(VERSION)|g" $(DESTDIR)$(PREFIX)/bin/mad
	$(INSTALL) -Dm0644 share/mad/mad.md $(DESTDIR)$(PREFIX)/share/mad/mad.md
	$(INSTALL) -Dm0644 etc/mad.conf $(DESTDIR)$(PREFIX)/etc/mad.conf
	$(INSTALL) -Dm0644 etc/bash_completion/mad $(DESTDIR)$(COMPLETION)/mad

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/mad \
		$(DESTDIR)$(PREFIX)/share/mad \
		$(DESTDIR)$(PREFIX)/etc/mad.conf \
		$(DESTDIR)$(COMPLETION)/mad

.PHONY: all install uninstall
