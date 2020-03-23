#lang sicp
(#%require sicp-pict)

; Exercise 2.50 - define transformation "flip-horiz" and
; transformations that rotate painters counter-clockwise by 180 and 270
  
(define (flip-horiz painter) 
 (transform-painter painter 
                    (make-vect 1.0 0.0) 
                    (make-vect 0.0 0.0) 
                    (make-vect 1.0 1.0))) 
  
(define (rotate180 painter) 
 (transform-painter painter 
                    (make-vect 1.0 1.0) 
                    (make-vect 0.0 1.0) 
                    (make-vect 1.0 0.0))) 
  
(define (rotate270 painter) 
 (transform-painter painter 
                    (make-vect 0.0 1.0) 
                    (make-vect 0.0 0.0) 
                    (make-vect 1.0 1.0))) 