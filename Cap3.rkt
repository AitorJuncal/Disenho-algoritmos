#lang racket
;Ejercicio 1
(define (make-accumulator inicial)
  (let ((acumulado inicial))
    (lambda (suma)
      (set! acumulado (+ acumulado suma))
      acumulado)))
(define A (make-accumulator 5))

;Ejercicio 2
(define (make-monitored proc) 
   (let ((count 0)) 
     (lambda (first . rest) 
       (cond ((eq? first 'how-many-calls?) count) 
             ((eq? first 'reset-count) (set! count 0)) 
             (else (begin (set! count (+ count 1))  
                          (apply proc (cons first rest))))))))

(define s (make-monitored sqrt))
(s 100)
(s 100)
(s 'how-many-calls?)


;Ejercicio 3
(define f   
   (let ((init 0)) 
     (lambda (x)  
       (set! init (- x init))  
       (- x init))))