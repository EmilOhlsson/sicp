#lang sicp
(define (square x) (* x x))
(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
	    (cons (square (car things))
		  answer))))
  (iter items '()))
(square-list-1 (list 1 2 3 4 5 6))
; Reverses becuase consing will reverse it. Kind of like a stack
; First:  (cons 1 '())
; second: (cons 4 prev),  

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
	    (cons answer
		  (square (car things))))))
  (iter items '()))
(square-list-1 (list 1 2 3 4 5 6))
; Reverses because
; First  (cons '() 1)
; Second (cons prev 4)
; Third  (cons prev 9) -> (list (list... ) ..)
