#lang sicp
;Exercise 2.13 - Demonstrate that an approximate percentage for tolerances can be calculated
;from the product of two intervals in terms of the tolerances of the factors

(define (make-interval a b)
  (if (> a b) (cons a b) (cons b a)))

(define (upper-bound x) (car x))
(define (lower-bound x) (cdr x))

(define (make-center-percent center percentage)
  (let ((upper-bound (* center (/ (+ 100 percentage) 100.0)))
        (lower-bound (* center (/ (- 100 percentage) 100.0)))
       )
  (cons upper-bound lower-bound)))

(define (find-percent-difference x y)
  (abs (- (* (/ x y) 100) 100)))

(define (percent-tolerance interval)
  (let ((center (/
                  (+ (upper-bound interval) (lower-bound interval))
                  2)))
    (find-percent-difference (upper-bound interval) center)))

;procedure given
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;as the tolerance will be small (0-100)
;the product's tolerance should be close to the sum of the individual tolerances
(define x (make-center-percent 3 8))
(define y (make-center-percent 2 5))
(display (percent-tolerance x))
(newline)
(display (percent-tolerance y))
(newline)
;product tolerance
(display (percent-tolerance (mul-interval x y)))