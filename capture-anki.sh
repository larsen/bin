#!/bin/bash

emacsclient -c -e "(progn (add-hook 'org-capture-after-finalize-hook (lambda () (delete-frame)) nil t) (org-capture nil \"a\"))"
