(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (my-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
	      '()
	      sequence))

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq2))

(define (my-length sequence)
  (accumulate (lambda (x y) (+ 1 y) 0 sequence))
