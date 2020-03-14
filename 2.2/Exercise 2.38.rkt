; Exercise - 2.38

(define nil '())
(define (fold-right f initial sequence)
  (if (null? sequence)
      initial
      (f (car sequence)
         (fold-right f
                     initial
                     (cdr sequence)))))
         
(define (fold-left f initial sequence)
  (define (iter-fold result rest)
    (if (null? rest)
        result
        (iter-fold (f result (car rest))
              (cdr rest))))
  (iter-fold initial sequence))

; calculate the values of the following
(fold-right / 1 (list 1 2 3))
(fold-left  / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left  list nil (list 1 2 3))

; give a property that f would produce the same values in a sequence
; for both fold-left and fold-right
; operator needs to be commutative in-order for both products to be equal
(fold-left + 0 (list 1 5))
(fold-right + 0 (list 1 5))
