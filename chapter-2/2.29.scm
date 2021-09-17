(define (make-mobile left right)
  (list left right))

;; a - write corresponding selectors
(define (left-branch node)
  (car node))

(define (right-branch node)
  (cadr node))

;; b - Total weight of mobil
(define (total-weight node)
  (cond ((null? node) 0)
	((not (pair? node)) node)
	(else (+ (total-weight (left-branch node))
		 (total-weight (right-branch node))))))

;; c - Create a predicate for checking 
(define (balanced? node)
  (cond ((null? node) #t)
	((not (pair? node)) #t)
	(else (and (= (total-weight (left-branch node))
		      (total-weight (right-branch node)))
		   (balanced? (left-branch node))
		   (balanced? (right-branch node))))))

(define balanced-tree (make-mobile (make-mobile 2 2) (make-mobile (make-mobile 1 1) (make-mobile 1 1))))
(define unbalanced-tree (make-mobile (make-mobile 2 2) (make-mobile (make-mobile 1 2) (make-mobile 1 1))))
