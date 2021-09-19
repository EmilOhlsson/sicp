(define (accumulate op init seq)
  (if (null? seq)
    init
    (op (car seq)
	(accumulate op init (cdr seq)))))

(define (filter pred? seq)
  (if (null? seq) '()
    (let
      ((rest (filter pred? (cdr seq))))
      (if (pred? (car seq))
	(cons (car seq) rest)
	rest))))

(define (enumerate-interval lo hi)
  (if (> lo hi)
    '()
    (cons lo (enumerate-interval (+ lo 1) hi))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
	     (map (lambda (j) (list i j))
		  (enumerate-interval 1 (- i 1))))
	     (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (define (prime? n)
    (define (test div)
      (cond ((> (* div div) n) #t)
	    ((= 0 (remainder n div)) #f)
	    (else (test (+ div 1)))))
    (test 2))
  (define (make-sum-pair pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
  (define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))
  (map make-sum-pair
       (filter prime-sum? (unique-pairs n))))
