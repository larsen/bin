#!/usr/local/bin/emacs --script

(require 'package)
(package-initialize)

(require 'pdf-annot)
(require 'cl)

(setq large-file-warning-threshold nil)

(defun usage ()
  (error "You need to provide a pattern to search"))

(defun all-pdf-files (path)
  "Recursively find every PDF file starting from PATH."
  (directory-files-recursively path ".*\.pdf"))

(defun annotation-contents (annot)
  "Return the text content in ANNOT. Newlines are converted to
spaces."
  (replace-regexp-in-string "\n" " " (cdr (assoc 'contents annot))))

(defun get-all-annotations (file)
  "Return all annotations saved in FILE, as a concatenation of
their contents."
  (let* ((annots (with-current-buffer (find-file file)
                   (pdf-view-mode)
                   (pdf-annot-getannots nil nil))))
    (mapconcat 'annotation-contents annots " ")))

(defun search-in-annots (pattern file)
  (let ((all-annotations (get-all-annotations file)))
    (when all-annotations
      (if (string-match pattern all-annotations)
          (princ (format "%s: %s\n" file all-annotations))
        nil))))

(cl-defun pdf-search (pattern &optional (path "."))
  "Search for PATTERN in the annotations for every PDF file
recursively found starting from PATH. If PATTERN is found in a
file, print its absolute filename and the entire set of
annotations saved in the file."
  (message (format "Looking for \"%s\" in %s" pattern path))
  (dolist (pdf-file (all-pdf-files path))
    (search-in-annots pattern pdf-file)))

(let ((pattern (or (nth 3 command-line-args)
                   (usage)))
      (path (or (nth 4 command-line-args)
                ".")))
  (pdf-search pattern path))
