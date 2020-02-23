#lang sicp
(define (square x) (* x x))

(define (square_sum x y) (+ (square x) (square y)))

(define (find_smallest x y z) (
                               cond ((and (< x y) (< x z)) (square_sum y z))
                                    ((and (< y x) (< y z)) (square_sum x z))
                                    ((and (< z x) (< z y)) (square_sum y x))
                               )
  )

(define (a_plus_b_abs a b) ((if(> b 0) + -) a b))
(a_plus_b_abs 12 -9)