#lang sicp
;Exercise 2.5
(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (car z)
  (define (iter x count)
    ;divide by two until we hit a remainder
    ;this is the maximum exponent of 2 within x
    (if (= 0 (remainder x 2))
        (iter (/ x 2) (+ count 1))
        count))
    (iter z 0))

(define (cdr z)
  (define (iter x count)
    ;divide by three until we hit a remainder
    ;this is the maximum exponent of 3 within x
    (if (= 0 (remainder x 3))
        (iter (/ x 3) (+ count 1))
        count))
  (iter z 0))
