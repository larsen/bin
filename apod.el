#!/usr/local/bin/emacs --script

(require 'package)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d")

(require 'larsen-functions)

(defvar nasa-api-endpoint "https://api.nasa.gov")
(defvar nasa-api-key (or (getenv "NASA_APIKEY")
                         (error "You need to set NASA_APIKEY env variable!")))
(defvar apod-pictures-root "~/Pictures/apod")

(defun apod (&optional date)
  (when date (message "Fetching APOD metadata for %s" date))
  (get-json-data
   (format "%s/planetary/apod?api_key=%s%s"
           nasa-api-endpoint
           nasa-api-key
           (if date
               (format "&date=%s" date)
             ""))))

(defun ensure-directory-exists (dir)
  (message (format "Creating directory %s" dir))
  (condition-case err
      (make-directory dir :create-parents)
    (error (message (cadr err)))))

(defun save-explanation (explanation dir)
  (write-region explanation nil
                (expand-file-name "explanation"
                                  target-directory)))

(defun save-apod (hdurl target-directory)
  (url-copy-file hdurl (expand-file-name (url-file-nondirectory hdurl)
                                         target-directory)))

(defun fetch-apod (&optional date)
  (when date (message "APOD for %s" date))
  (let* ((apod-payload (apod date))
         (payload-media-type (cdr (assoc 'media_type apod-payload)))
         (payload-date (cdr (assoc 'date apod-payload)))
         (payload-hdurl (cdr (assoc 'hdurl apod-payload)))
         (payload-explanation (cdr (assoc 'explanation apod-payload)))
         (target-directory (format "%s/%s/" apod-pictures-root payload-date)))
    (cl-assert (not (string-equal "video" payload-media-type)))
    (ensure-directory-exists target-directory)
    (save-explanation payload-explanation target-directory)
    (save-apod payload-hdurl target-directory)))


(with-positional-args
 ((date))
 (fetch-apod date))
