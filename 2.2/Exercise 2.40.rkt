; Exercise 2.40 - define a procedure "unique-pairs"

(define nil '())
(define (accumulate f initial sequence)
  (if (null? sequence)
      initial
      (f (car sequence)
         (accumulate f
                     initial
                     (cdr sequence)))))

(define (enumerate-interval low high) 
   (if (> low high) 
       nil 
       (cons low (enumerate-interval (+ low 1) high)))) 

(define (flat-map proc sequence)
  (accumulate append nil (map proc sequence)))

(define (unique-pairs n)
  (flat-map (lambda (i)
              (map
               (lambda (j) (list i j))
               (enumerate-interval 1 (- i 1)))) ; create and map through list of integers (1..., i - 1)
          (enumerate-interval 1 n))); sequence given to flat-map list of integers (1..., i)

; use unique pairs to simplify the definition of prime-sum-pairs
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter
        prime-sum?
        ; generates a unique set of pairs from an integer n
        (unique-pairs n))))
            