; Exercise 2.21 - complete the two definitions of "square" given

(define nil '())

; Square definition one
(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

; Square definition two
(define (list-map f items)
  (if (null? items)
      nil
      (cons (f (car items))
            (map f (cdr items)))))

(list-map (lambda (x) (* x x)) '(2 3 5 6 7))