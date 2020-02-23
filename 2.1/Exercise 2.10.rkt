#lang sicp
;Exercise 2.10 - Modify "div-interval" to handle division by zero error
(define (div-interval x y)
  (if (or (= 0 upper-bound y) (= 0 lower-bound y))

  (error "Cannot divide by zero")
  
  (mul-interval
     x
     (make-interval (/ 1.0 (upper-bound y))
                    (/ 1.0 (lower-bound y)))))
)
