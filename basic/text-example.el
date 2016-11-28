;; text文本相当的函数

(defun lebe-say-word (word)
  "获得当前光标下的单词"
  (interactive (list
                (read-string (format "word (%s): " (thing-at-point 'word))
                             nil nil (thing-at-point 'word))))
  (message "The word is %s" word))
