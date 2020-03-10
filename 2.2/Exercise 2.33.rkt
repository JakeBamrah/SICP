; Exercise 2.34 - complete the procedures by
; filling in the missing expressions

(define (accumulate f initial sequence)
  (if (null? sequence)
      initial
      ; accumulator proc takes two arguments
      (f (car sequence)
          (accumulate f
                      initial 
                      (cdr sequence)))))

(define (map-list f sequence)
  ; staying focused on the body of the lambda operation
  ; makes the accumalation useage easier to understand
  (accumulate(lambda (first acc) (cons (f first) acc))
              nil sequence))

(define (append-list seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length-list sequence)
  (accumulate (lambda (first acc) (+ 1 acc))
   0 sequence))