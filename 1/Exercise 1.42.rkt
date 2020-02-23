#lang sicp
;Exercise 1.42
;define a proceedure "compose" that implements composition so that x -> f(g(x))
;where f is only defined after g ((compose square inc) 6) -> 49

(define (square x) (* x x))

;method 1
(define (compose f)
   (lambda (g)
     (lambda (x) (f (g x)))
  ))

;method 2;
(define (compose-two f g)
  (lambda (x)
    (f (g x))))

(((compose square) inc) 6)
((compose-two square inc) 6)