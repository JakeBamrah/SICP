#lang sicp
(#%require sicp-pict)

; Exercise 2.44 - define a procedure up-split used by corner-split

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter
               (beside smaller smaller)))))

(paint (up-split einstein 3)) ;paint 3 layers of 'up-split' from the identity drawing