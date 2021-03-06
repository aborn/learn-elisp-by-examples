;; 函数相关的例子

(require 'cl-lib)
(defun lebe-fun-parameter (a &optional b &rest args)
  "函数可选参数例子"
  (interactive)
  (when (null b)
    (message "paramete b is not provided, use default.")
    (setq b "ddd"))    ;; set to default value
  (message "a=%s, b=%s, rest-args-length:%d" a b (length args)))

(defun lebe-fun-map-reduce ()
  "Map-reduce operation.对一个List先做map成另一个list，再做reduce操作。
  依赖cl-lib这个package。"
  (interactive)
  (let ((example-list '(1 4 3 8)))
    (message "resulet is %d"
             (cl-reduce '+
                        (mapcar
                         #'(lambda (x)
                             (if (> x 3)
                                 1
                               x))
                         example-list)))
    ))

(defun lebe-fun-para (&optional a b)
  "函数参数及let里的参数"
  (interactive)
  (let ((b (or b "bbbbcc")))
    (message "b===%s" b))
  (message "a=%s" a)
  (unless a
    (message "not provide a")
    (setq a "bbb"))
  (message "a=%s" a)
  (let ((a "aaa")
        (b) (c "ccc") d e)
    (message "a=%s  b=%s  c=%s d=%s e=%s" a b c d e)))

;; 注意是值传递，值传递
(defun lebe-fun-value-ref-call ()
  (let ((a '((a . "aa")
             (b . "bb"))))
    (message "call before length %s" (length a))
    (lebe-fun-value-ref a)
    (message "call after length %s" (length a))))

(defun lebe-fun-value-ref (a)
  "add item"
  (message "call in before length %s" (length a))
  (add-to-list 'a '(c . "cc"))
  (message "call in after length %s" (length a)))

(defun lebe-fun-exit-any-arbitrary-point ()
  "How to exit from a function at any arbitrary point, in elisp
   http://stackoverflow.com/questions/16248620/how-to-exit-from-a-function-at-any-arbitrary-point-in-elisp
   "
  (interactive)
  (let ((a "a"))
    (catch 'return
      (when (equal "a" a)
        (throw 'return "non-local exit value"))
      (message "normal exit value"))))

;; 来源 https://www.gnu.org/software/emacs/manual/html_node/elisp/Prefix-Command-Arguments.html
(defun display-prefix (arg)
  "Display the value of the raw prefix arg."
  (interactive "P")
  (message "%s" arg))
