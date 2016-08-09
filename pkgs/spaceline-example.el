;; 定义一个mode line的segment
(spaceline-define-segment leanote-status
  "show the leanote status"
  (when leanote-mode
    (powerline-raw
     (s-trim (leanote-status))))
  :when active)

;; 对于spaceline 1.x 版本
;; 可以添加到 spaceline-left 的列表里
(unless (assq '(leanote-status :when active) spaceline-left)
  (add-to-list 'spaceline-left '(leanote-status :when active) t))

;; 对于spaceline 2.x 版本
(spaceline-spacemacs-theme 'leanote-status)
(spaceline-compile)          ;; install leanote-status to spaceline--mode-lines
