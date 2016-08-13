;; 函数相关的例子

;; 函数可选参数
(defun lebe-fun-parameter (a &optional b &rest args)
  (interactive)
  (when (null b)
    (message "paramete b is not provided, use default.")
    (setq b "ddd"))    ;; set to default value
  (message "a=%s, b=%s, rest-args-length:%d" a b (length args)))
