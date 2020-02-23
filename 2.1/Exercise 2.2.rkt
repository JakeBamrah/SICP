#lang sicp
;Exerise 2.2
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (average x y) (/ (+ x y) 2.0))

(define (make-segment start end) (cons start end))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))

(define (x-point x) (car x))

(define (y-point y) (cdr y))

(define (mid-point p1 p2)
  (make-point
     (average (x-point p1) (x-point p2))
     (average (y-point p1) (y-point p2))
  )
)
              
(define point-one (make-point 3 5))
(define point-two (make-point -4 2))
(define mid (mid-point point-one point-two))