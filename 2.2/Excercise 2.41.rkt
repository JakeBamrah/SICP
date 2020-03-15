; Exercise 2.41 - write a procedure to find all ordered triples of
; distinct positive integers i, j, k less than a given integer n
; that sum to a given integer s

; supporting procedures
(define nil '())
(define (accumulate f initial sequence)
  (if (null? sequence)
      initial
      (f (car sequence)
         (accumulate f initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flat-map proc sequence)
  (accumulate append nil (map proc sequence)))

(define (filter predicate sequence)
  (cond ((if (null? sequence) nil)
         (predicate (car sequence))
                    (cons (car sequence)
                    (filter predicate (cdr sequence))))
         (else (filter predicate (cdr sequence)))))


; triple procedures
(define (unique-triples n)
  (flat-map (lambda (i)
              (flat-map (lambda (j)
                          (map (lambda (k) (list i j k))
                               (enumerate-interval 1 (- j 1))))
                   (enumerate-interval 1 (- i 1)))); enumerate from n rather than i here to give ALL pairs
            (enumerate-interval 1 n)))

(define (triples-that-sum-equals max-value sum)
  (filter
   (lambda (triple)
     (= (accumulate + 0 triple) sum)); filter based on triple sum
   (unique-triples max-value)))
   
   
(unique-triples 4)
(triples-that-sum-equals 4 9)