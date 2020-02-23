#lang sicp
;Exercise 2.9 Show that the width of the sum (or difference) of two
;intervals is a function only of the widths of the intervals being added (or subtracted)
(define (make-interval a b)
  (if (> a b) (cons a b) (cons b a)))

intervals a + b = (make-interval ((+ aHigher bHigher), (+ aLower bLower)))
width = (* 1/2 (- (+ aHigher bHigher) (+ aLower bLower)))
OR
width = (* 1/2 (+ (- aHigher bLower) (- bHigher bLower)))

;The width of the sum (or difference) of two intervals is a function of the widths of those intervals.

