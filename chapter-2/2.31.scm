(define (tree-map proc tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	   (tree-map proc sub-tree)
	   (proc sub-tree)))
       tree))

(define (square-tree tree)
    (tree-map (lambda (x) (* x x)) tree))

(display (square-tree
  (list 1
	(list 2 (list 3 4) 5)
	(list 6 7))))
(newline)
