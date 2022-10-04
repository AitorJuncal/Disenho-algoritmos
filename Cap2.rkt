#lang racket

;Ejercicio 1. Diseñe una versión iterativa del método fast-expt
(define (fast-expt n b)
   (fast-expt-iter n b b))

(define (fast-expt-iter n b acumulado)
  (cond ((= n 0) 1)
        ((= n 1) acumulado)
        (else (fast-expt-iter (- n 1) b (* acumulado b)))))


;Ejercicio 3. Rellene el código de forma que se elimine la recursión lineal.
(define (sum term a next b)
  (define (iter a result)
   (if (> a b)
       result
       (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (inc n) (+ n 1))
(sum identity 1 inc 10)


;Ejercicio 4.Escriba dos versiones del procedimiento producto, una que genere un proceso recursivo y otra un proceso
;iterativo. Calcule la eficiencia en memoria y en número de operaciones.
(define (product term a next b)
  (if (> a b)
   1
  (* (term a)
     (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
   (if (> a b)
       result
       (iter (next a) (* result (term a)))))
  (iter a 1))

;Ejercicio 5. Escriba dos programas en Scheme, uno que genere un proceso recursivo y otro iterativo. Demuestre que

;Ejercicio 6. Explique el error que se genera con una evaluación.
(define x 5)
(+ (let ((x 3))
(+ x (* x 10)))
x)
;Realmente no hay un error en la evaluación, si no que se observa que la variable x cambia segun en que ambito se encuentra. Uno podría pensar que si definimos
;la variable x como 5, esta valdrá 5 y por lo tanto el resultado será 60. Sin embargo esto no es así y el valor es 38. Esto es porque la expresión let nos
;permite modificar el valor de una variable dentro de un ambito concreto. Dentro del ambito del let x vale 3, pero al salir de ese ambito vale 5. Se podría decir
;que el let nos permite instanciar una variable como local al ambito. En conclusión el procedimiento para llegar a la solución es:
;Ambito let --> 3 + (3 * 10) = 33
;Ambito global --> 33 + 5 = 38.



;Ejercicio 7. Explique que occure con las siguientes evaluaciónes: (f square), (f (lambda (z) (* z (+ z 1)))) y (f f)
(define (f g) (g 2))
;En esta definición. Definimos una función f que toma otra función como parámetro, la función g. Luego aplica la funcion g con el parámetro 2. O dicho de otra forma,
;evalua la función g con un 2 como argumento.

;Primer caso : (f square)
(define (square x) (* x x))
(f square)
;la función f evalua correctamente su argumento, que es a su vez otra función(square), por lo que se realiza con exito el square de 2, es decir, la expresión
;(f square) devuelve 4.

;Segundo caso : (f (lambda (z) (* z (+ z 1))))
 (f (lambda (z) (* z (+ z 1))))
;En este caso, la función que se pasa como parámetro es una función lambda, es una función sin nombre pero que igualmente nos sirve y la podemos evaluar correctamente.
;Por lo que simplemente el interprete tiene que evaluar la función lambda con un 2 como argumento, dando como resultado (2+1) * 3 = 6

;tercer caso: (ff)
;(f f)
;El interprete nos dice. "application: not a procedure expected a procedure that can be applied to arguments". Esto es por que estamos pasando la propia función f
;como parámetro a la función f. Por lo que lógicamente el interprete no puede evaluar correctamente el procedimiento.