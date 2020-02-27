;Exercise 2.18 - Define a procedure "reverse" that
;takes a list and returns a list with it's elements reversed

(define nil '())

;this could be done with the given "append" procedure but
;I couldn't figure out the solution
(define (reverse-list items)
  (define (reverse-iter items result)
    ;avoid (cdr items) here as it causes boundary errors
    (if (null? items)
        result
        (reverse-iter (cdr items)
                      (cons (car items) result))))
  (reverse-iter items nil))
