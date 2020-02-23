#lang sicp
;Exercise 2.6
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;expand and reduce using the substitution method
(add-1 zero)

; -> (add-1 (lambda (f) (lambda (x) x)))

; -> (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x) f) x)))))

; -> (lambda (f) (lambda (x) (f (f x))))

(define one (lambda (f) (lambda (x) (f (f x)))))

;expand and reduce to calculate two
(add-1 one)

; -> (add-1 (lambda (f) (lambda (x) (f (f x)))))

; -> (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f (f x)))) f) x))))

; -> (lambda (f) (lambda (x) (f (f (f x)))))

(define two (lambda (f) (lambda (x) (f (f (f x))))))

;part two - define an addition procedure without using add-one
(define (add m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))
