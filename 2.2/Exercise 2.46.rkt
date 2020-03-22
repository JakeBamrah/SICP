#lang sicp

; Exercise 2.46 - implement the following vector procedures

; constructor
(define (make-vect x y) (cons x y))

; selectors
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

; vector procedures - add-vect, sub-vect and scale-vect(multiply)

(define (add-vect v1 v2)
  (cons (+ (xcor-vect v1) (xcor-vect v2))
        (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (cons (- (xcor-vect v1) (xcor-vect v2))
        (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect scalar v)
  (cons (* scalar (xcor-vect v))
        (* scalar (ycor-vect v))))

