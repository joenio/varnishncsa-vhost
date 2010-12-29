SHELL = /bin/sh
manpage = varnishncsa-vhost.1
program = varnishncsa-vhost

install: manpage dirs
	cp -f $(program) $(DESTDIR)/usr/bin
	cp -f $(manpage).gz $(DESTDIR)/usr/share/man/man1
	cp -f convert-old-logs $(DESTDIR)/usr/share/doc/$(program)

dirs:
	mkdir $(DESTDIR)
	mkdir $(DESTDIR)/usr $(DESTDIR)/usr/bin
	mkdir $(DESTDIR)/usr/share $(DESTDIR)/usr/share/man $(DESTDIR)/usr/share/man/man1
	mkdir $(DESTDIR)/usr/share/doc $(DESTDIR)/usr/share/doc/$(program)

manpage:
	perldoc -d $(manpage) -o nroff $(program)
	gzip --force $(manpage)

clean:
	$(RM) $(manpage)*
