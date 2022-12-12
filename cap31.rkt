#lang racket
;Ejercicio 1
"EJERCICIO 1"
(define (make-accum n)
  (lambda (x)
    (set! n (+ n x))
    n
  ))

(define a (make-accum 0))
(a 10)

;¿Qué es lo que pasa cuando se llama a la siguiente evaluación (define a (make-accum 0))? Complete el
;código anterior utilizando como ámbito un diccionario python

;env -> {'x' : 10} --> {'n' : 0'}
;(set! n (+ n x)) --> (set! 'n' (+ 0 10))
(a 10)
;env -> {'x' : 10} --> {'n' :10'}
;(set! n (+ n x)) --> (set! 'n' (+ 10 10))

;Ejercicio 3
"EJERCICIO 3"
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

;Este procedimiento no es correcto, porque cuenta muchas veces las estructuras de datos compartidas.
;Por ejemplo
 (define lista1 '(x y z)) 
 (count-pairs lista1) ; Devuelve 3

 (define x '(x)) 
 (define y (cons x x)) 
 (define lista2 (list y)) 
 (count-pairs lista2) ; Devuelve 4

 (define lista3 (cons y y)) 
 (count-pairs lista3) ; Devuelve 7

 (define z (cons y y))
 (define lista4 (cons z z))
 (count-pairs lista4) ; Devuelve 15
;Vamos combinando haciendo un cons con elementos previamente definidos anteriormente, esto va escalando
;3->4->7->15...etc
;La solución a esto es usar mcons como estructuras de datos y modificar el metodo anterior para que también se
;adapte a las estructuras mutables quedando así:
(define (count-pairs2 x)
  (if (not (mpair? x))
      0
      (+ (count-pairs2 (mcar x))
         (count-pairs2 (mcdr x))
         1)))

;Ejercicio 4
 (define (make-queue) 
   (let ((front-ptr '()) (rear-ptr '())) 
        (define (set-front-ptr! item) (set! front-ptr item)) 
        (define (set-rear-ptr! item) (set! rear-ptr item))
         (define (emtpy-queue?) (null? front-ptr)) 
         (define (front-queue)  
           (if (emtpy-queue?) 
             (error "FRONT called with an empty queue") 
             (car front-ptr))) 
         (define (insert-queue! item) 
           (let ((new-pair (cons item '()))) 
             (cond ((emtpy-queue?) 
                     (set-front-ptr! new-pair) 
                     (set-rear-ptr! new-pair)) 
                     (else  
                     (set-cdr! rear-ptr new-pair) 
                     (set-rear-ptr! new-pair))))) 
         (define (delete-queue!) 
           (cond ((emtpy-queue?) 
                   (error "DELETE called with an emtpy queue")) 
                 (else (set-front-ptr! (cdr front-ptr))))) 
    
  
         (define (dispatch m) 
           (cond ((eq? m 'empty-queue) emtpy-queue?) 
                 ((eq? m 'front-queue) front-queue) 
                 ((eq? m 'insert-queue!) insert-queue!) 
                 ((eq? m 'delete-queue!) delete-queue!) 
                 (else (error "operacion no valida")))) 
         dispatch)) 