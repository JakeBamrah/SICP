; Exercise 2.37 - complete the given matrix procedures

(define matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define matrix-n (list (list 1 2) (list 4 5) (list 6 7) (list 8 3)))

(define (accumulate f initial sequence)
  (if (null? sequence)
      initial
      (f (car sequence)
         (accumulate f
                     initial
                     (cdr sequence)))))


(define nil '())
(define (accumulate-n f initial seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate f initial (map car seqs))
            (accumulate-n f initial (map cdr seqs)))))

; notice how we start with low-level procedures - (dot-product is our primitive)
; which allows us to build higher-order procedures while abstracting the details
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;((* mi v)(* mj v)(* mk v))
(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product v row)) m))

(define (transpose n)
  (accumulate-n cons '() n))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-row)
           (map (lambda (col)
                  (dot-product m-row col))
                cols)) m)))

(matrix-*-matrix matrix matrix-n)