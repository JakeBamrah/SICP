#lang sicp
;Exercise 1.45
(define tolerance 0.0001)

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

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (power x n)
  (if (= n 1)
      x
      (* x (power x (- n 1)))))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (nth-root x nth damp)
  (fixed-point
   ((repeated average-damp damp)
    (lambda (y)
      (/ x (power y (- nth 1)))))
   1.0))

(nth-root 5 3 2)