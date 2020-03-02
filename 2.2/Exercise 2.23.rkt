; Exercise 2.23 - give an implementation of "for-each"

(define nil '())
(define (for-each-list f items)
  (if (null? items)
      nil
      (f (car items)))
      (for-each f (cdr items)))