#lang sicp
;Exercise 1.40 - define cubic proceedure that can used together with Newton's method

;all procedures provided except bar cubic
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       dx))
  ;using linear recursion, compute the fixed point using the function given
  (define (try guess)
    (let ((next (f guess)))
      (display guess) (newline)
      ;if the guess is within tolerance return next otherwise try again
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x )))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* x x a) (* x c) c)))

;notice how quick this proceedure converges compared to fixed point or average-damping
(newtons-method (cubic 1 2 6) 1)