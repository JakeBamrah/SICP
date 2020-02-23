#lang sicp
;Exercise 1.44
;create a function "smooth" that takes a proceedure f as input
;and returns the the smoothed f where f(x) -> average f(x-dx), f(x), f(x + dx)

(define dx 0.0001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

((smooth (lambda (x) (* x x x))) 4)

;part 2 demonstrate how to smooth a proceedure repeatedly n-fold
;use the repeat proceedure compose (1.42) and repeated (1.43)
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

;define "smooth-nth"
(define (smooth-nth f n)
  ((repeated smooth n) f))

((smooth-nth (lambda (x) (* x x x)) 3) 4)