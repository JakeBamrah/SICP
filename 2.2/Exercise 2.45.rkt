#lang sicp
(#%require sicp-pict)

; Exercise 2.45 - define a procedure split that can be used to define up-split and right-split

(define (split original-orient split-orient)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split original-orient split-orient) painter (- n 1))))
          (original-orient painter
                           (split-orient smaller smaller))))))


(define up-split (split beside below))
(define right-split (split below beside))