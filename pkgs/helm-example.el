;; 采用helm做为补全
(require 'helm)

(defun lebe-helm-default ()
  "heml default usage"
  (interactive)
  (let (collection)
    (setq collection '(("first key" "first value") ("second" "The second one") ("c" "ccc")))
    (helm :sources (helm-build-sync-source "test"
                     :candidates collection
                     :fuzzy-match t
                     :action (lambda (x)
                               (message "select: %s" (car x))))
          :buffer "*helm test*"
          )))

(defvar lebe-helm-bookmark-list
  '(
    ("facebook" "https://www.facebook.com/?_rdr=p")
    ("github" "https://github.com/aborn")
    ("gmail" "https://mail.google.com/mail/u/0/#inbox")
    ("music" "https://play.google.com/music/listen?authuser#/wmp")
    ("photos" "https://photos.google.com/")
    ("twitter" "https://twitter.com/")
    ("water" "https://www.cityofmadison.com/epayment/water/index.cfm")
    ))

(defun lebe-helm-bookmark-open (link)
  "Opens a browser bookmark"
  (interactive
   (helm-comp-read "Select bookmark: " lebe-helm-bookmark-list))
  (browse-url link))
