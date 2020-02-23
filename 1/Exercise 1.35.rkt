#lang sicp
;Exercise 1.35
;Show that the fixed point of the golden ratio is x -> 1 + 1/x
;x -> 1 + 1/x => (* x x) - x - 1 = 0

(define tolerance 0.0001)

;function fixed-point given
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  ;using linear recursion, compute the fixed point using the function given
  (define (try guess)
    (let ((next (f guess)))
      ;if the guess is within tolerance return next otherwise try again
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;returns golden ratio
(fixed-point (lambda(x) (+ 1 (/ 1 x))) 1.0)