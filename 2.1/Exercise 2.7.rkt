#lang sicp
;Exercise 2.7
;constructor
(define (original-make-interval a b) (cons a b))

;more consistent make-interval procedure - ensure the largest value is always first
(define (make-interval a b)
  (if (> a b) (cons a b) (cons b a)))

;Exercise 2.7 define interval selectors
(define (upper-bound x) (car x))
(define (lower-bound x) (cdr x))
