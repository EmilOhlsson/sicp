(define (sum-triplets n s)
  (let ((triplets
	  (flatmap (lambda (i)
		     (flatmap (lambda (j)
				(map (lambda (k) (list i j k))
				     (enumerate-interval 1 (- j 1))))
			      (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n))))
    (filter (lambda (seq) (= (accumulate + 0 seq) s)) triplets)))
