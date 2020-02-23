#lang sicp
;Exercise 1.36
(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.0001)

;function fixed-point given
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  ;using linear recursion, compute the fixed point using the function given
  (define (try guess)
    (let ((next (f guess)))
      (display guess) (newline)
      ;if the guess is within tolerance return next otherwise try again
      (if (close-enough? guess next)
           next
          (try next))))
  (try first-guess))

(display (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.1)) (newline)
