#lang simply-scheme
;; Write a procedure switch that takes a sentence as its argument and returns a sentence
;; in which every instance of the words I or me is replaced by you, while every instance of
;; you is replaced by me except at the beginning of the sentence, where it’s replaced by I.
;; (Don’t worry about capitalization of letters.) Example:
;; > (switch ’(You told me that I should wake you up))
;; (i told you that you should wake me up)

(define (checkWord word)
  (if (= word 'you)
      ('me)
      word)
  (if (= word 'i)
      ('you)
      word)
  (if (= word 'me)
      ('you)
      (word)))

(define (switch-word w)
  (cond ((equal? w 'i)  'you)
        ((equal? w 'me) 'you)
        ((equal? w 'you) 'me)
        (else w)))

(define (replacemesen phrase)
  (if (empty? phrase)
    '()
    (sentence (switch-word (first phrase))
              (replacemesen (butfirst phrase)))))

(replacemesen '(you told you that you should wake me up))
(replacemesen '(i told me that i should wake me up))
