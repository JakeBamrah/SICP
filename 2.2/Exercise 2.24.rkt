; Exercise 2.24 - evaluate the given expression,
; give box-pointer notation and the interperated tree structure

(define (counted-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (counted-leaves (car x))
           (counted-leaves (cdr x))))))

(counted-leaves (list 1 (list 2 (list 3 4))))

; result - 4

; box-pointer notation
; (1 (2 (3 4)))

; | 1 | -> | (2 (3 4)) | -> null
;            |
;          | 2 | -> | 3 4 | -> null
;                     |
;                   | 3 | -> | 4 | -> null


; tree interpretation
; (1 (2 (3 4)))
;    /   \
;  1   (2 (3 4)
;        / \
;      2   (3 4)
;           / \
;          3   4