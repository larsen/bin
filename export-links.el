#!/usr/local/bin/emacs --script

;; $ emacs --script export-links.el > ~/.local/share/uzbl/bookmarks

(require 'package)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d")

(require 'larsen-functions)
(require 'larsen-orgmode)

(loop for l in (get-webjump-sites)
      when l
      do (princ (format "%s %s\n" (cdr l) (car l))))
