#lang sicp

(define (write-line msg)
    (begin (display msg)
           (newline)))

(write-line "exercise 1.3")
(define (square x) (* x x))
(define (sum-of-squares a b) (+ (square a) (square b)))
(define (max-squared a b c)
        (cond ((and (< a b) (< a c)) (sum-of-squares b c))
              ((and (< b a) (< b c)) (sum-of-squares a c))
              (else (sum-of-squares a b))
        ))

(max-squared 1 2 3)

(write-line "exercise 1.4")
(define (a-plus-abs-b a b) ((if (< b 0) - +) a b))
(a-plus-abs-b 0 -5)

(display "exercise 1.5")
; With applicative order evaluation the test never terminates, but normal does with result 0
;(define (p) (p))
;(define (test x y) (if (= 0 x) 0 y))
;(test 0 (p))
