#lang simply-scheme
;; Write a procedure squares that takes a sentence of numbers as its argument and
;; returns a sentence of the squares of the numbers:
;; > (squares ’(2 3 4 5))
;; (4 9 16 25)

;; (define (squares sentence)
;;   ;; (if (empty? sentence))
;;   ;; '()
;;   (se (square (first sentence) (squares (butfirst squares)))))

(define (squares sentence)
  (if (empty? sentence)
    '()
    (se (square (first sentence))
    (squares (butfirst sentence)))))

;; (define (square1 x)
;;   (first x)
;;   (* x x))

;; (define (getfirst x)
;;   (first x))

(define (square x) (* x x))

(squares '(2 3 4 5))
