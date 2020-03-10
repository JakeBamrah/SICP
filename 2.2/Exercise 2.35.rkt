; Exercise 2.35 - re-define counted-leaves (2.2.2) as an accumalation

(define (accumulate f initial sequence)
  (if (null? sequence)
      initial
      ; accumulator proc takes two arguments
      (f (car sequence)
          (accumulate f
                      initial 
                      (cdr sequence)))))

(define nil '())
(define (enumerate-tree tree)
 (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append 
               (enumerate-tree (car tree))
               (enumerate-tree (cdr tree))))))

; using enumerated-tree given earlier
(define (counted-leaves-enum tree)
  (accumulate
   +
   0
   (map (lambda (x) 1) (enumerate-tree tree))))

(define (counted-leaves tree)
  (accumulate
   ; lambda accumalator or + operator can be used
   (lambda (first acc) (+ 1 acc))
   0
   (map (lambda (x)
          (cond ((null? x) 0)
                 ((pair? x) (counted-leaves x))
                 (else x)))
          tree)))
              
(counted-leaves-enum '(1 4 '(5 7 '(6 8))))
(counted-leaves (list 1 4 (list 5 7 (list 6 8))))