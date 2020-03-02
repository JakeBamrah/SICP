#lang sicp
; Exercise 2.20 - Define a procedure same-parity that
; uses dotted-tail-notation to take one or more integers and
; return a list of arguments that have the same even-odd parity as the first argument


(define (same-parity x . values)
  (define (iter-items items)
    (if (null? items)
        '()
    (if (even? (+ (car items) x))
        (cons (car items) (iter-items (cdr items)))
        (iter-items (cdr items)))))
  (cons x (iter-items values)))
    
(same-parity 2 4 5 8 5 3) 
    