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
