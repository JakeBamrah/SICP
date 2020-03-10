; Exercise 2.34 - complete the following procedure that
; evalutates Horners rule for polynomials

(define (accumulate f initial sequence)
  (if (null? sequence)
      initial
      ; accumulator proc takes two arguments
      (f (car sequence)
          (accumulate f
                      initial 
                      (cdr sequence)))))


(define (horner-eval x coefficient-sequence)
  (accumulate
   (lambda (this-coeff higher-terms)
     ; the polynomial always starts with an int and is then followed by n(x)
     ; the initial coeff is always added to the product of the (* higher-terms x)
      (+ this-coeff (* higher-terms x)))
   0
   coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))
  