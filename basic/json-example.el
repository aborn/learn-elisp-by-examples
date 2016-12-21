;; json-example.el some json-usage exampels

(require 'json)

(defun lebe-json-read-file ()
  "read json file"
  (interactive)
  (let* ((fname (expand-file-name "json.txt" "~/github/learn-elisp-by-examples/basic")))
    (setq ab/debug (json-read-file fname))
    ))
