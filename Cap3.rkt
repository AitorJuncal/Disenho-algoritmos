#lang racket
;Ejercicio 1
(define (make-accumulator inicial)
  (let ((acumulado inicial))
    (lambda (suma)
      (set! acumulado (+ acumulado suma))
      acumulado)))
(define A (make-accumulator 5))

;Ejercicio 2
(define (make-monitored funcion)
  (let ((llamadas 0))
    (define (dispatch m)
      (cond 
        ((eq? m 'how-many-calls?) llamadas)
        ((eq? m 'reset-count) (set! llamadas 0))
        (else
          (set! llamadas (+ 1 llamadas))
          (funcion m))))
    dispatch))

(define s (make-monitored sqrt))
(s 100)
(s 100)
(s 'how-many-calls?)

;Ejercicio 3
(define f  
    (let ((init 0))  
     (lambda (x)  
         (set! init  (- x init)) 
         init)))
(+ (f 0) (f 1))
(+ (f 1) (f 0))