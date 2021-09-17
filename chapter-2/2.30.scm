(define (square x) (* x x))

(define (square-tree-v1 tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (square tree))
	(else (cons (square-tree-v1 (car tree))
		    (square-tree-v1 (cdr tree))))))

(define (square-tree-v2 tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	   (square-tree-v2 sub-tree)
	   (square sub-tree)))
       tree))

(display (square-tree-v1
  (list 1
	(list 2 (list 3 4) 5)
	(list 6 7))))
(newline)

(display (square-tree-v2
  (list 1
	(list 2 (list 3 4) 5)
	(list 6 7))))
(newline)
