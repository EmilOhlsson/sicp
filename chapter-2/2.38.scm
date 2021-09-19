(define (fold-right op init seq)
  (if (null? seq)
    init
    (op (car seq)
	(fold-right op init (cdr seq)))))

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
	    (cdr rest))))
  (iter init seq))

;(fold-right / 1 (list 1 2 3))
; -> 3/2

;(fold-left / 1 (list 1 2 3))
; -> 1/6

;(fold-right list '() (list 1 2 3))
; -> (list 1 (list 2 (list 3 (list '()))))

;(fold-left list '() (list 1 2 3))
; -> (list (list (list (list '()) 1) 2) 3)
