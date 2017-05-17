#!/usr/local/bin/emacs --script

;; $ emacs --script export-links.el > ~/.local/share/uzbl/bookmarks

(require 'package)
(package-initialize)
(add-to-list 'load-path "/home/larsen/.emacs.d")

(require 'larsen-functions)
(require 'larsen-orgmode)

(loop for l in (get-webjump-sites)
      do (princ (format "%s %s\n" (cdr l) (car l))))