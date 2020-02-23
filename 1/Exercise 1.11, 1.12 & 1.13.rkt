#lang sicp
(define (f n)
  (cond((< n 3) n)
       (>= n 3)
      (else (+
           (f (- 1 n) (* (f (- n 2)) 2) (* (f (n - 3))))
    ))))


(define (i-f n)
  (define (iter a b count)
    (if (
