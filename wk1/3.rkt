#lang simply-scheme
;; Write a procedure switch that takes a sentence as its argument and returns a sentence
;; in which every instance of the words I or me is replaced by you, while every instance of
;; you is replaced by me except at the beginning of the sentence, where it’s replaced by I.
;; (Don’t worry about capitalization of letters.) Example:
;; > (switch ’(You told me that I should wake you up))
;; (i told you that you should wake me up)
;; Check if first
(define (checkFirstWord word)
  (if (word "you")
      ("I") ;; true
  (if (word "You")
      ("I") ;; true
      (word)))) ;; else

(define (checkWord word)
  (if (= word "you")
      ("me") ;; true
  (if (word "i")
      ("you")
  (if (word "me")
      ("you")
      (word)))))

(define (replaceme sentence)
  (if (empty? sentence)
    '()
    (se (checkFirstWord (first sentence))
        (replaceme  (checkWord (butfirst sentence))))))

(replaceme '(You told you that you should wake me up))
