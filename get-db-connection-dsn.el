#!/usr/local/bin/emacs --script

(with-no-warnings
  (require 'package)
  (package-initialize)
  (add-to-list 'load-path "~/.emacs.d/lisp")
  (require 'larsen-sql)
;  (require 'larsen-functions)
  )

(defun arg-resolver (arg-properties idx)
  (cond ((eq :default (car arg-properties))
         `(or (nth ,idx command-line-args)
              ,(cadr arg-properties)))
        ((eq :mandatory (car arg-properties))
         `(or (nth ,idx command-line-args)
              (error (or ,(cadr arg-properties)
                         "Undefined error"))))
        (t (nth idx command-line-args))))

(defmacro with-positional-args (arglist &rest body)
  "Execute the forms in BODY after lexically binding command line
arguments in order, according to what is specified in ARGLIST.
ARGLIST is the list of variables that will be bound to the
corresponding command line argument."
  `(let ,(cl-loop for a in arglist
               for idx from 3
               collect (let ((arg-name (car a))
                             (arg-properties (cdr a)))
                         `(,arg-name ,(arg-resolver
                                       arg-properties idx))))
     ,@body))

(with-positional-args
 ((connection-name)
  (connection-detail :default "dsn"))
 (princ (my/get-connection-detail connection-name
                                  (intern connection-detail))))
