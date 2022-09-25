#lang sicp
(+ 5 5 )
(+ (* 3 ;; 3 * (8+8) = 48
      (+ (* 2 4)
         (+ 3 5 )))
   (+ (- 10 7)) ;; 48 + 3 + 6 = 57
      6)
(define lol 5)
lol ;; 5

(+ (* 4
      (+ (+ 5 9)
         (+ 2 3 )))
   (+ (- 8 2))
      2)


(define (square x) (* x x)) ;; procedure definition
(square 5) ;; multiply 5 (x) by itself

;; procedure definition structure
;; (define (<name>) <formal parameters>)
;;   <body>)