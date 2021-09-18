(define (accumulate op initial seq)
  (if (null? seq)
    initial
    (op (car seq)
	(accumulate op initial (cdr seq)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
	  (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w )))

(define (matrix-*-vector m v)
  (map (lambda (r) (dot-product r v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (r) (matrix-*-vector cols r)) m)))
  
(define sample-matrix (list
			(list 1 2 3)
			(list 4 5 6)
			(list 7 8 9)))

(define sample-vector (list 1 2 3))
