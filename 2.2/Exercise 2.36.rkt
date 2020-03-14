; Exercise 2.36

(define nil '())
(define (accumulate f initial sequence)
  (if (null? sequence)
      initial
      (f (car sequence)
         (accumulate f
                     initial
                     (cdr sequence)))))

; retrieve the first item of each sequence
(define (car-list l)
  (if (null? l)
      l
      (cons (car (car l)) (car-list (cdr l)))))

; retrieve the last items of each sequence
(define (cdr-list l)
  (if (null? l)
      l
      (cons (cdr (car l)) (cdr-list (cdr l)))))

(define (accumulate-n f initial seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate f initial (car-list seqs))
            (accumulate-n f initial (cdr-list seqs)))))

; later realised that this can be done much cleaner with map
(define (accumulate-n-map f initial seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate f initial (map car seqs))
            (accumulate-n f initial (map cdr seqs)))))

(define x (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(accumulate-n + 0 x)
(accumulate-n-map + 0 x)