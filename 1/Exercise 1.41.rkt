#lang sicp
;Exercise 1.41 - define a proceedure double that returns a proceedure that applies the original proceedure twice

(define (square) (lambda (x) (* x x)))

(define (double f)
  (lambda (x) (f (f x))))
