#lang sicp

(define (filter pred seq)
  (cond ((null? seq) '())
	((pred (car seq))
	 (cons (car seq)
	       (filter pred (cdr seq))))
	(else (filter pred (cdr seq)))))

(define (same-parity x . xs)
  (if (even? x)
    (filter even? (cons x xs))
    (filter odd? (cons x xs))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
