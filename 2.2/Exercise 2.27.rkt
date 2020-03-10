; Exercise 2.27 - Modify "reverse" to reverse both lists and nested lists

; reverse procedure
(define nil '())
(define (revers-list list)
  (define (reverse-iter l result)
    (if (null? l)
        result
        (reverse-iter (cdr l)
                      (cons (car items) result))))
  (reverse-iter list nil))


(define (deep-reverse list)
  ; use result as an accumalator for reversed nodes
  (define (deep-reverse-iter l result)
    (if (null? l)
        result
        ; if the node is a pair (not a leaf) then treat it as a tree
        ; otherwise, deep-reverse-iter through the rest of the list
        (if (pair? (car l))
                   (deep-reverse-iter (cdr l) (cons (deep-reverse (car l)) result ))
                   (deep-reverse-iter (cdr l)(cons (car l) result)))))
  (deep-reverse-iter list nil))


; after doing some research, it appears that a much cleaner way would be to use map
(define (deep-reverse-map list)
  (if (pair? list)
    (reverse (map deep-reverse-map list))
    list))

; thoughts - would deep-reverse #1 be an example of mutual recursion?

(define x '((1 2) (3 4)))

(deep-reverse x)
(deep-reverse-map x)