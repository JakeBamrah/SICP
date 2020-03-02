;Exercise 2.17 - Define a procedure last-pair
;that returns a list that contains the last element

(define (last-pair items)
  (cond ((null? items) '())
        ((if (null? (cdr items))
          items
          (last-pair (cdr items))))))
