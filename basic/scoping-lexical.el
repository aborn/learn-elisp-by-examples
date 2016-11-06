;;; scoping-lexical.el --- lexical scoping 静态作用域例子.  -*- lexical-binding: t; -*-

;; 来自 https://kuanyui.github.io/2016/02/24/dynamic-scoping-and-lexical-scoping/

;; 有名字的函數
(let ((lexical-a 3))
  (defun triple (x)
    (* lexical-a x))
  (message "let in call (triple 7)=%s"
           (triple 7)))  ;; 這個 (triple 7) 是在 let 中呼叫，跟前面的例子一樣，可以正常運作，得到 21

(message "out call (triple 7)=%s"
         (triple 7)  ;; 注意！這次竟然沒炸掉！還正常運作，得到 21
         )

(defun generate-member-decider (list)
  (lambda (x) (member x list)))

;; 產生 fruit? 這個會判斷是否為水果的 function
(setq fruit? (generate-member-decider '("apple" "banana" "citrus" "durian")))

;; 如果不加 lexical-binding: t; 就是动态作用域，执代码会报以下错：
;;    Symbol’s value as variable is void: list
(message "%s %s %s"
         (funcall fruit? "cucumber") ;; => nil
         (funcall fruit? "cat")      ;; => nil
         (funcall fruit? "citrus")   ;; => ("citrus" "durian")
         )
