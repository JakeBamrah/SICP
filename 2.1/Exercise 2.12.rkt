#lang sicp
;Exercise 2.12 - Define a constructor "make-center-percent that takes a center and percentage tolerance
;returning the desired interval

(define (make-interval a b)
  (if (> a b) (cons a b) (cons b a)))

(define (upper-bound x) (car x))
(define (lower-bound x) (cdr x))

(define (make-center-percent center percentage)
  (let ((upper-bound (* center (/ (+ 100 percentage) 100.0)))
        (lower-bound (* center (/ (- 100 percentage) 100.0)))
       )
  (cons upper-bound lower-bound)))

;similarily this could also be calculated by finding the width
;(let ((width (* c (/ percentage 100)))))
;(cons (+ center width) (- center width))

(define (find-percent-difference x y)
  (abs (- (* (/ x y) 100) 100)))

(define (percent-tolerance interval)
  (let ((center (/
                  (+ (upper-bound interval) (lower-bound interval))
                  2)))
    (find-percent-difference (upper-bound interval) center)))
