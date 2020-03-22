#lang sicp

; Exercise 2.49 - use segments->painter to define the following procedures

(define (outline->painter frame) 
 (let ((origin2 (make-vect  
                 (- (xcor-vect (side2-frame frame))  
                    (xcor-vect (origin-frame frame))) 
                 (- (ycor-vect (side1-frame frame))  
                    (ycor-vect (origin-frame frame)))))) 
   (segments->painter  
    (list           
     (make-segment (origin-frame frame) (side1-frame frame)) 
     (make-segment (side1-frame frame) origin2) 
     (make-segment origin2 (side2-frame frame)) 
     (make-segment (side2-frame frame) (origin-frame frame)))))) 
  
(define (cross->painter frame) 
 (let ((origin2 (make-vect  
                 (- (xcor-vect (side2-frame frame))  
                    (xcor-vect (origin-frame frame))) 
                 (- (ycor-vect (side1-frame frame))  
                    (ycor-vect (origin-frame frame)))))) 
   (segments->painter  
    (list           
     (make-segment (origin-frame frame) origin2) 
     (make-segment (side1-frame frame) (side2-frame frame)))))) 
  
(define (diamond->painter frame) 
 (let ((midpoint1 (sub-vect (side1-frame frame) (origin-frame frame)))  
       (midpoint2 (sub-vect origin2 (side1-frame frame)))  
       (midpoint3 (sub-vect origin2 (side2-frame frame))) 
       (midpoint4 (sub-vect (side2-frame frame) (origin-frame frame)))) 
   (segments->painter  
    (list           
     (make-segment midpoint1 midpoint2) 
     (make-segment midpoint2 midpoint3) 
     (make-segment midpoint3 midpoint4) 
     (make-segment midpoint4 midpoint1))))) 