;; swiper 相关api 补全
;; 注意这里与：lebe-swiper-default有点不太一样
;; https://github.com/abo-abo/swiper

(require 'ivy)
(defun lebe-swiper-default ()
  "swiper ivy-read example."
  (interactive)
  (let (collection)
    (setq collection '(("first key" "first value") ("second" "The second one") ("c" "ccc")))
    (ivy-read "search:"
              collection
              :action (lambda (x)
                        (message "select:%s" (car x))))
    ))
