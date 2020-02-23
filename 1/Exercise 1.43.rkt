#lang sicp
;Exercise 1.43
;define a proceedure that takes a proceedure and a positive integer n
;where n dictated the number of times that proceedure is called
;return the "product" proceedure that accepts a value

(define (square x) (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      ;my head hurts
      (compose f (repeated f (- n 1)))))

((repeated square 2) 5)