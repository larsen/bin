#!/usr/local/bin/emacs --script

(with-no-warnings
  (require 'package)
  (package-initialize)
  (add-to-list 'load-path "~/.emacs.d")
  (require 'larsen-sql)
  (require 'larsen-functions))

(with-positional-args
 ((connection-name)
  (connection-detail :default "dsn"))
 (princ (my/get-connection-detail connection-name
                                  (intern connection-detail))))
