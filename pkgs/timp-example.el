;; Timp相关，这个package的项目在
;; https://github.com/mola-T/timp

(require 'timp)
(defun lebe-timp-example ()
  "test timp multi-thread, actual its multi-process"
  (interactive)
  (let ((thread1 (timp-get :name "thread1" :persist t)))
    (when (timp-validate thread1)
      (message "thread1: alive")
      ;; 这个require-package的机制比较好，不需要处理load-path
      (timp-require-package thread1 'aborn-log)  
      (timp-send-exec thread1 (lambda ()
                                (aborn/log "begin to run thread1.")
                                (message "start thread1 job...")
                                (sleep-for 10)
                                (message "after 10s")
                                (sleep-for 50)
                                (message "after 50s")
                                (sleep-for 120)
                                (message "after 120s")
                                (mapcar 'number-to-string (number-sequence 1 99)))
                      :reply-func (lambda (result)
                                    (aborn/log "finished thread1, now callback!")
                                    (message "finished thread1 job. now callback!")
                                    (message (car (last result)))))
      (timp-quit thread1))))
