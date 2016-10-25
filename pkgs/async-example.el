;; 异步执行的库，相关的请参考timp-example
;; https://github.com/jwiegley/emacs-async

;; common async example
(defun lebe-async-example ()
  (interactive)
  (let* ((begin-time (current-time))
         (bexp "gggggg"))
    (async-start
     ;; What to do in the child process
     ;; 注意：如果是lexical-binding:t的话，这里的bexp参数会找不到
     `(lambda ()
        ,(async-inject-variables "\\`begin-time\\'")
        ,(async-inject-variables "\\`bexp\\'")
        ,(async-inject-variables "\\`load-path\\'") ;; add main process load-path
        (add-to-list 'load-path "~/.spacemacs.d/parts")
        (require 'aborn-log)
        (aborn/log (format "This is a test %s %S" bexp begin-time))
        (sleep-for 3)
        begin-time)
     ;; What to do when it finishes
     (lambda (result)
       (message "Async process done, time cost: %ss"
                (float-time (time-subtract (current-time) result)))))))

;; 在子进程中插入参数
;; add some parameters in sub-process
(defun lebe-async-param ()
  (interactive)
  (let* ((param "value param")
         (param-b "b b b")
         (param-c "god is c"))
    (async-start
     `(lambda ()
        (set 'param-c ,param-c)
        ,(async-inject-variables "\\`param\\'")
        ,(async-inject-variables "\\`param-b\\'") 
        (format "param = %s, param-b = %s, param-c = %s"
                param param-b param-c))
     'lebe-async-param-callback)))

(defun lebe-async-file-exec (callback)
  "async"
  (let ((fname (buffer-file-name)))
    (async-start
     `(lambda ()
        (set 'fname ,fname)
        fname)
     callback)))

(defun lebe-show-buffer-name ()
  (interactive)
  (message "%s" (buffer-name)))

;; 子进程中文件处理
(defun lebe-async-file ()
  "File dealing in subprocess"
  (interactive)
  (let* ((fname (buffer-file-name)))
    (when fname
      (message "fname=%s" fname)
      (lebe-async-file-exec
       (lambda (result)
         (message "fname async =%s" result)
         (when (file-exists-p result)
           (message "file exists!")
           (with-current-buffer (get-buffer-create result)
             (erase-buffer)
             (insert "aaaaaaaaa\nbbbbb")
             (message "async buffername=%s" (buffer-name))
             (message "buffer-file-name=%s" (buffer-file-name))
             (message "content:%s" (buffer-string))
             (write-file result)
             ;;(save-buffer)
             )
           )
         )
       ))))

;; call back
(defun lebe-async-param-callback (result)
  "finished call"
  (message "async result is %s" result))
