; Exercise 2.30 - define a procedure square-tree

(define (square-tree tree)
  (map (lambda (sub-tree)
    (if (list? sub-tree)
      (square-tree sub-tree)
      (* sub-tree sub-tree)))
  tree))

; once you traverse down a tree
; there is no ability to traverse back up outside the tree
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))