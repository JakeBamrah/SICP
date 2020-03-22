#lang sicp

; Exercise 2.48 - define a constructor make-segment
; and it's accompanying selectors start-segment and end-segment

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)