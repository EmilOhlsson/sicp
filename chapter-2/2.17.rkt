#lang sicp
(define (last-pair lst)
  (if (null? (cdr lst))
    lst
    (last-pair (cdr lst))))
(last-pair (list 23 17 149 34))
