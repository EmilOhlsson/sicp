(define (fringe tree)
  (cond ((null? tree) tree)
	((not (pair? tree)) (list tree))
	(else (append (fringe (car tree))
		      (fringe (cdr tree))))))

(define x (cons (list 1 2) (list 3 4)))
(display (fringe x))
(newline)
