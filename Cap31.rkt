#lang racket
;Ejercicio 1
(define (make-accum n)
  (lambda (x)
    (set! n (+ n x))
    n
  ))

(define a (make-accum 0))
(a 10)
;env -> {'x' : 10} --> {'n' : 0'}
;(set! n (+ n x)) --> (set! 'n' (+ 0 10))
(a 10)
;env -> {'x' : 10} --> {'n' :10'}
;(set! n (+ n x)) --> (set! 'n' (+ 10 10))

;Ejercicio 3
(define (count-pairs x)
 (if (not (mpair? x))
 0
 (+ (count-pairs (mcar x))
 (count-pairs (mcdr x))
 1)))


(define pares (mcons 1 (mcons 2 (mcons 3 ()))))
(count-pairs pares)