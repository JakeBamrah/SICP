#lang sicp
;Exercise 2.4
;verify that (car (cons x y)) yields x for any object x y
(define (cons x y)
  (lambda (m) (m x y)))

;pass the callback procedure returned from cons object to car
;callback takes a procedure and passes it two arguments
(define (car z)
  (z (lambda (p q) p)))

;define corresponding cdr procedure
(define (cdr z)
  (z (lambda (p q) q)))
