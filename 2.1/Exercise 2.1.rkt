#lang sicp
;Exercise 2.1 - define a version of 'make-rat' that handles both positive and negative arguements

;current make-rat
(define (make-rat-original n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;gcd given
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;normalised rat
(define (make-rat n d)
  (let (
        (g ((if (< d 0) - +) (abs (gcd n d))))
       );end of let statement!!
  
   (cons (/ n g) (/ d g))))
   

(print-rat (make-rat 3 4))
(print-rat (make-rat -3 4))
(print-rat (make-rat 3 -4))