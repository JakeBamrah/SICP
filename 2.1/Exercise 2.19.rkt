#lang sicp
; Exercise 2.19 - re-write count change procedure
; also define first-denomination, exept-first-denom and no-more?

(define first-denomination car)
(define except-first-denom cdr)
(define (no-more? denominations) (null? denominations))

; a calling (define first-denominations car) is a more efficient method that (car denominations)
; this is because it requires one less function call
  
 (define (cc amount denominations) 
   (cond  
    ((= amount 0) 1) 
     
    ; ran out of potential solutions or denominations
    ((or (< amount 0) (no-more? denominations)) 0) 
     
    (else 
     ; count change without the current coin type
     (+ (cc amount (except-first-denom denominations))
        ; count change by first subtracting the currenct coint type
        (cc (- amount  
               (first-denomination denominations))  
            denominations))))) 
  