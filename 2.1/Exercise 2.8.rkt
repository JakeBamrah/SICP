#lang sicp
;Exerise 2.8
(define (make-interval a b)
  (if (> a b) (cons a b) (cons b a)))

(define (upper-bound x) (car x))
(define (lower-bound x) (cdr x))

;Exercise 2.8 define "sub-interval"
;min value would be the smallest value of (- x largest of y)
;max value would be the largest of (- x smallest of y)
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
