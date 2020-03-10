; Exercise 2.31 - abstract "square-tree" (2.30) using a procedure tree-map

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (list? sub-tree)
             (tree-map f sub-tree)
             (f sub-tree)))
       tree))

(define (square x) (* x x))

(define x (list 1
          (list 2 (list 3 4) 5)
          (list 6 7)))

(tree-map square x)


