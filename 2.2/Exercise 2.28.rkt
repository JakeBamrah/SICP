; Exercise 2.28 - define a procedure fringe which
; takes a list and returns a list of all of it's leaves from l -> r

(define nil '())
(define (fringe l)
  (define (fringe-iter items result)
    (if (null? items)
        result
        (if (list? items)
            (fringe-iter (car items) (fringe-iter (cdr items) result))
            (cons items result))))
  (fringe-iter l nil))

(define x (list (list 1 2) (list 3 4)))
(fringe (list x x))