
(defun lebe-debug-demo ()
  "debug demo function"
  (interactive)
  (let ((a "a")
        (b "value b")
        (c 1))
    (debug)
    (message "middle")
    (setq c (+ 1 c))
    (xyz "a")
    (message "ggg")
    ))
