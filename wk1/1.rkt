;; evaluate arguments then apply - applicative-order eval

(define (square x) (* x x)) ;; procedure definition
(square 5) ;; multiply 5 (x) by itself

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ ( + x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x) x)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
;; new-if is a function not a cond. new-if will evaluate args then apply - since
;; function uses recursion, it will loop

;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;           guess
;;           (sqrt-iter (improve guess x) x)))
;; `if` will check as it goes, normal "cond"

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(sqrt 9)
(sqrt-iter 5 5)
