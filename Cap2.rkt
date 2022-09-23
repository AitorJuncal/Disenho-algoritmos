#lang racket

;Ejercicio 1. Diseñe una versión iterativa del método fast-expt
(define (fast-expt n b)
   (fast-expt-iter n b b))

(define (fast-expt-iter n b acumulado)
  (cond ((= n 0) 1)
        ((= n 1) acumulado)
        (else (fast-expt-iter (- n 1) b (* acumulado b)))))


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