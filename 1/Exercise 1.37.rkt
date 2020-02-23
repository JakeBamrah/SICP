#lang sicp
;Exercise 1.37
(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ 1 i))))))
  (recur 1))

(cont-frac-recur (lambda (i) 1.0) (lambda (i) 1.0) 12)

