;; 函数相关的例子

;; 函数可选参数
(defun lebe-fun-parameter (a &optional b &rest args)
  (interactive)
  (when (null b)
    (message "paramete b is not provided, use default.")
    (setq b "ddd"))    ;; set to default value
  (message "a=%s, b=%s, rest-args-length:%d" a b (length args)))

(defun lebe-fun-map-reduce ()
  "Map-reduce operation."
  (interactive)
  (let ((example-list '(1 4 3 8)))
    (message "resulet is %d"
             (reduce '+
                     (mapcar
                      #'(lambda (x)
                          (if (> x 3)
                              1
                            x))
                      example-list)))
    ))

(defun lebe-fun-para (&optional a)
  (interactive)
  (message "a=%s" a)
  (unless a
    (message "not provide a")
    (setq a "bbb"))
  (message "a=%s" a)
  (let ((a "aaa")
        (b) (c "ccc"))
    (message "a=%s  b=%s  c=%s" a b c)))
