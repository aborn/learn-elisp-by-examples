;; 默认的completing-read
;; 要看下你emacs的completing-read-function这个变量值是什么
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Minibuffer-Completion.html

(defun lebe-completing-read (search)
  "default completing-read example"
  (interactive
   (list (completing-read "search by key:"
                          '(("first key" "first value") ("second" "The second one") ("c" "ccc")))))
  (message "%s" search))

;; swiper 相关api 补全
;; 注意这里与：lebe-swiper-default有点不太一样
;; https://github.com/abo-abo/swiper
(require 'ivy)
(defun lebe-swiper-ivy-read ()
  "swiper ivy-read example."
  (interactive)
  (let (collection)
    (setq collection '(("first key" "first value") ("second" "The second one") ("c" "ccc")))
    (ivy-read "search:"
              collection
              :action (lambda (x)
                        (message "select:%s" (car x))))
    ))
