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

;Ejercicio 2
(define (append x y)
 (if (null? x)
    y
    (mcons (mcar x) (append (mcdr x) y))))

(define (append! x y)
    (set-mcdr! (last-pair x) y)
       x)

(define (last-pair x)
  (if (null? (mcdr x))
    x
   (last-pair (mcdr x))))

(define x (mcons 'a (mcons 'b null)))
(define y (mcons 'c (mcons 'd null)))
(define z (append x y))
z
(mcons 'a (mcons 'b (mcons 'c (mcons 'd '()))))
(cdr x)
(define w (append! x y))
w
(mcons 'a (mcons 'b (mcons 'c (mcons 'd '()))))
(cdr x)

