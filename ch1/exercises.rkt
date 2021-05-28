#lang sicp

(display "exercise 1.3\n")
(define (square x) (* x x))
(define (sum-of-squares a b) (+ (square a) (square b)))
(define (max-squared a b c)
        (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
              ((and (<= b a) (<= b c)) (sum-of-squares a c))
              (else (sum-of-squares a b))
        ))

(max-squared 1 2 3)
(max-squared 4 3 3)

(display "exercise 1.4\n")
(define (a-plus-abs-b a b) ((if (< b 0) - +) a b))
(a-plus-abs-b 0 -5)

(display "exercise 1.5\n")
; With applicative order evaluation the test never terminates, but normal does with result 0
;(define (p) (p))
;(define (test x y) (if (= 0 x) 0 y))
;(test 0 (p))

(display "exercise 1.6\n")

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x) (sqrt-iter 1.0 x))
(sqrt 9)
;(define (new-if predicate then-clause else-clause)
;        (cond (predicate then-clause)
;              (else else-clause)))
;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x)
;                 x)))


;; Using the applicative order evaluation result an infinite expansion of new-if
;; due to the recursive nature of sqrt iter.
;; (sqrt 9)
;;    v
;; (sqrt-iter 1.0 9.0)
;;    v
;; (new-if (good-enough? 1.0 9.0) 1.0 (sqrt-iter (improve 1.0 9.0) 9.0)) 
;;    v
;; (new-if (good-enough? 1.0 9.0) 1.0 (sqrt-iter (improve 1.0 9.0) 9.0)) 
;;
;; Here the problem is that new-if and sqrt-iter will expand at the same time,
;; resulting in a new identical situation

(display "exercise 1.7\n")
;; When calculating roots smaller than the good enough the initial guess will be
;; "good enough", even though it isn't. Say calulating the sqrt of 0.000001,
;; then we'll get 0.0313 as result, but true result is 0.001.
;; For larger numbers we might hit scenarios were the difference between the
;; guess cannot be represented as small as the threshold, resulting in "jumping"
;; between two guesses, without ever finding a solution

(sqrt 0.000001)
;;(sqrt 1e13)
(define (good-enough-v2? guess0 guess1)
  (< (abs (- (/ guess0 guess1) 1.0)) 0.001))

(define (sqrt-iter-v2 guess0 guess1 x)
  (if (good-enough-v2? guess0 guess1)
      guess1
      (sqrt-iter-v2 guess1 (improve guess1 x) x)
      )
  )

(define (sqrt-v2 x) (sqrt-iter-v2 1.0 x x))

(sqrt-v2 9.0)
(sqrt-v2 0.000001)
(sqrt-v2 1e13)


(display "exercise 1.8\n")
(define (improve-cube guess x)
  (/ (+ (/ x (square guess)) (* 2.0 guess)) 3.0)
  )

(define (cube-root-iter guess0 guess1 x)
  (if (good-enough-v2? guess0 guess1)
     guess1
     (cube-root-iter guess1 (improve-cube guess1 x) x)
     )
  )

(define (cube-root x) (cube-root-iter 1.0 x x))
(cube-root 27)

