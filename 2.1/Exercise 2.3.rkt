#lang sicp
;Exercise 2.3
(define (average x y) (/ (+ x y) 2.0))

;point procedures
(define (make-point x y) (cons x y))

(define (x-point x) (car x))

(define (y-point y) (cdr y))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


;segment procedures
(define (make-segment start end) (cons start end))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (segment-length p1 p2)
  (sqrt
    (+ (- (x-point p2) (x-point p1))
    (- (y-point p2) (y-point p1)))))

;constructor - build rectangle
(define (rectangle bottom-left top-right)
  (cons bottom-left top-right))


;selectors; private - define rectangle points
(define (bottom-left r) (car r))

(define (bottom-right r)
  (make-point (x-point (top-right r)) (y-point (bottom-left r))))

(define (top-right r) (cdr r))

(define (top-left r)
  (make-point (x-point (bottom-left r)) (y-point (top-right r))))

(define (side-length p1 p2)
  (segment-length p1 p2))


;public - rectangle methods
(define (rect-perimeter r)
  (let (
    (p1 (bottom-left r))
    (p2 (bottom-right r))
    (p3 (top-right r))
    (p4 (top-left r))
  )
  (* (+ (side-length p1 p2) (side-length p1 p4)) 2)))

(define (rect-area r)
  (let (
    (p1 (bottom-left r))
    (p2 (bottom-right r))
    (p3 (top-right r))
    (p4 (top-left r))
  )
  (* (side-length p1 p2) (side-length p1 p4))))
