#!/usr/local/bin/emacs --script

(require 'package)
(package-initialize)

(require 'pdf-annot)
(require 'commander)
(require 'cl)

(defun usage ()
  (error "You need to provide a pattern to search"))

(defun all-pdf-files (path)
  (directory-files path t ".*\.pdf"))

(defun annotation-contents (annot)
  (replace-regexp-in-string "\n" " " (cdr (assoc 'contents annot))))

(defun get-all-annotations (file)
  (let* ((annots (with-current-buffer (find-file file)
                   (pdf-view-mode)
                   (pdf-annot-getannots nil nil))))
    (mapconcat 'annotation-contents annots " ")))

(defun search-in-annots (pattern file)
  (let ((all-annotations (get-all-annotations file)))
    (when all-annotations
      (if (string-match pattern all-annotations)
          (message (format "%s: %s" file all-annotations))
        nil))))

(cl-defun pdf-search (pattern &optional (path "."))
  (message (format "Looking for \"%s\" in %s" pattern path))
  (dolist (pdf-file (all-pdf-files path))
    (search-in-annots pattern pdf-file)))

(let ((pattern (or (nth 3 command-line-args)
                   (usage)))
      (path (or (nth 4 command-line-args)
                ".")))
  (pdf-search pattern path))


