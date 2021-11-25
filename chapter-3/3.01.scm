(define (make-accumulator init)
  (define (increase amount)
    (begin 
      (set! init (+ init amount))
      init))
  increase)
