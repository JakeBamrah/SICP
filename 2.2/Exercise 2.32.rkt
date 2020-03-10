; Exercise 2.32 - complete the given definition of "subsets"
; and give a clear explanation of why it works

(define nil '())
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; I honestly can't give a clear explanation of why this works,
; it hurts my head too much to think about

(subsets (list 1 2 3)) 