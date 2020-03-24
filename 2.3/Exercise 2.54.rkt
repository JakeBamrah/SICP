#lang sicp

; Exercise 2.54 - define equals? a more precise iteration of eq?

(define (equals? x y)
  (if (and (pair? x) (pair? y))
      (and (equals? (car x) (car y)) (equals? (cdr x) (cdr y)))
  (eq? x y)))
