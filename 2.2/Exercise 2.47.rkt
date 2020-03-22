#lang sicp

; Exercise 2.47 - define the appropriate selectors for each
; definition of 'make-frame'

(define (make-frame-list origin side1 side2)
  (list origin side1 side2))

(define (make-frame-cons origin side1 side2)
  (cons origin (cons side1 side2)))

; both cons and list use the same selectors for origin and side1
(define frame-origin car)
(define frame-side1 cadr)
(define frame-side2-list caddr)
(define frame-side2-cons cddr)