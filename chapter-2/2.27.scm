(define (deep-reverse lst)
  (cond ((null? lst) lst) 
	((not (pair? lst)) lst)
	(else (append (deep-reverse (cdr lst)) (list (deep-reverse (car lst)))))))

(define lst (list (list 1 2) (list 3 4) (list 5 6 7 (list 8 9))))
(display (deep-reverse lst))
(newline)
