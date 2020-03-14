; Exercise 2.39 - implement reverse using fold-left and fold-right

; combines the first element with the result
; of combining all elements to the right
(define nil '())
(define (fold-right f initial sequence)
  (if (null? sequence)
      initial
      (f (car sequence)
         (fold-right f
                     initial
                     (cdr sequence)))))

(define (fr-reverse sequence)
 (fold-right (lambda (x y)
               (append y (list x)))
             nil
             sequence))


; combines the last result with the result
; of combining all elements to the left
(define (fold-left f initial sequence)
  (define (iter-fold result rest)
    (if (null? rest)
        result
        (iter-fold (f result (car rest))
              (cdr rest))))
  (iter-fold initial sequence))

(define (fl-reverse sequence)
  (fold-left (lambda (x y)
         ; cons can be used instead of append here because
         ; the the lambda given to fold-left(iter-fold) will be called with the
         ; accumulated result rather than the (cdr sequence)
              (cons y x))
             nil
             sequence))
