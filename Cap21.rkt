#lang racket
;EJERCICIO 1: Compruebe con el modelo de substitución que (car (cons x y)) es x, además programe la función cdr correspondiente.
(define (H p q) p)
(define (J p q) q)
(define (car z0) (z0 H))
(define (cdr z1) (z1 J))
;Probamos el modelo de substitución para el caso x=1 y=2
;car(cons(1 2)) -> car(lambda z(z 1 2)) -> (lambda z(z 1 2)H) -> (H 1 2) -> 1.

;EJERCICIO 2: Escriba el código para cos-int, car-int y cdr-int, de forma que se utilice esta representación.
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (cos-int a b)
  (* (expt 2 a) (expt 3 b)))

(define (car-int c)
  (if (not (= (remainder c 2) 0))
      0
      (+ 1 (car-int (/ c 2)))))

(define (cdr-int c)
  (if (not (= (remainder c 3) 0))
      0
      (+ 1 (cdr-int (/ c 3)))))

;EJERCICIO 3: Defina 1 y 2 como funciones y defina la suma directamente como la composición de los dos elementos.
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (add-2 n)
  (lambda (f) (lambda (f) (lambda (x) (f ((n f) x))))))

(define (suma n)
  (lambda f (lambda (f) (lambda (f) (lambda (x) (f ((n f) x)))))))

;EJERCICIO 4: Defina los operadores lógicos usando solamente estas dos funciones.
(define (TRUE x y) x)
(define (FALSE x y) y)
;Funcion NOT
(define (NOT BOOL)
  (lambda (x y) (BOOL y x))
 )
;Funcion OR
(define (OR BOOL1 BOOL2)
  (lambda (x y) (BOOL1 (BOOL1 x y) (BOOL2 x y)))
)
;Funcion AND
(define (AND BOOL1 BOOL2)
  (NOT (OR (NOT BOOL1) (NOT BOOL2)))
 )
