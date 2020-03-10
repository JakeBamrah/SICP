; Exercise 2.29 - binary mobiles

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

; define left-branch and right-branch
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))

; define branch-length and branch-structure
(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))

; define total-weight that returns the total weight of the mobile
(define (total-weight mobile)
 (cond ((null? mobile) 0)
       ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))


; define balanced that dictates whether a mobile is balanced
; a balanced mobile occurs when the torque of the left branch = right branch
; torque is defined as the rod length * weight

; defining torque cleans up the balanced procedure
(define (torque branch)
  (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced mobile)
  (cond ((null? mobile) #t)
        ((not (pair? mobile)) #t)
        (else
         (and (= (torque (left-branch mobile))
                 (torque (right-branch mobile)))
              (balanced (branch-structure (left-branch mobile)))
              (balanced (branch-structure (right-branch mobile)))))))

; if the representation of mobile is changed from list -> cdr
; what changes are needed use the new representation

; car and cdr return the ACTUAL value for cons rather than a list containing that value
; this would need to be changed across the program as it currently expects a list rather than number primitive
; in many of the locations
