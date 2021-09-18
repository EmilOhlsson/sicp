(define (horner-eval x seq)
  (accumulate (lambda (c hi) (+ (* hi x) c))
	      0 seq))

(display (horner-eval 2 (list 1 3 0 5 0 1)))
(newline)
