#!/usr/bin/python
import gtk
c = gtk.Clipboard().wait_for_contents('text/html')
if c:
  print c.data
