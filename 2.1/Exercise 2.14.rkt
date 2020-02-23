#lang sicp
;Exercise 2.14

(define (make-interval a b)
  (if (> a b) (cons a b) (cons b a)))

(define (upper-bound x) (car x))(define (lower-bound x) (cdr x))

;given procedures
(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval 
                 (/ 1.0 (upper-bound y)) 
                 (/ 1.0 (lower-bound y)))))

;Parallel resistor formula #1
(define (par1 r1 r2)
  (div-interval 
   (mul-interval r1 r2)
   (add-interval r1 r2)))

;Parallel resistor formula #2
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval 
     one
     (add-interval 
      (div-interval one r1) 
      (div-interval one r2)))))


(define x (make-interval 3.21 2.79))
(define y (make-interval 4.816 3.784))

(display "par1 test x y")
(newline)
(display (par1 x y))
(newline)
(display "par2 test x y")
(newline)
(display (par2 x y))