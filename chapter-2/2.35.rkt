#lang sicp
(define tree (list (list 1 2) 3 4 (list 5 (list 6))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (assert v)
  (if (not v) (error "Assertion failed") nil))

(define (count-leaves node)
  (accumulate + 0
	      (map
		(lambda (node)
		     (cond ((null? node) 0)
			   ((pair? node) (count-leaves node))
			   (else 1)))
		node)))

(count-leaves tree)
(assert (= 6 (count-leaves tree)))
