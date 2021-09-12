#lang sicp
(define (reverse lst)
  (let
    ((rest (cdr lst)))
    (if (null? rest)
      lst
      (append (reverse rest) (list (car lst))))))
(reverse (list 1 4 9 16 25))
