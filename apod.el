#!/usr/local/bin/emacs --script

(require 'package)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d")

(require 'larsen-functions)

(defvar nasa-api-endpoint "https://api.nasa.gov")
(defvar nasa-api-key (or (getenv "NASA_APIKEY")
                         (error "You need to set NASA_APIKEY env variable!")))
(defvar apod-pictures-root "~/Pictures/apod")

(defun apod ()
  (get-json-data
   (format "%s/planetary/apod?api_key=%s"
           nasa-api-endpoint
           nasa-api-key)))

(defun ensure-directory-exists (dir)
  (message (format "Creating directory %s" dir))
  (condition-case err
      (make-directory dir :create-parents)
    (error (message (cadr err)))))

(defun fetch-apod ()
  (let* ((apod-payload (apod))
         (media-type (cdr (assoc 'media_type apod-payload)))
         (date (cdr (assoc 'date apod-payload)))
         (target-directory (format "%s/%s/" apod-pictures-root date))
         (hdurl (cdr (assoc 'hdurl apod-payload)))
         (explanation (cdr (assoc 'explanation apod-payload))))
    (cl-assert (not (string-equal "video" media-type)))
    (ensure-directory-exists target-directory)
    (url-copy-file hdurl (expand-file-name (url-file-nondirectory hdurl)
                                           target-directory))))

(fetch-apod)
