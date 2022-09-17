#lang racket
;1) Explicar la razón que está función no puede ser utilizada para calcular las raíces cuadradas.;
;Decir también si funcionan correctamente los siguientes códigos: (new-if (= 1 1) 0 5), (new-if (= 2 3) 0 5).s;
;Respecto a la primera pregunta, no podemos usar la función para calcular raíces cuadradas debido a la función new-if presente en el código. Esto ocurre porque el new-if utiliza el orden aplicativo, mientras que el if utiliza el orden normal;
;Este orden aplicativo implica evaluar las dos ramas de la condición, de forma que al evaluar la segunda se produce un bucle infinito ya que entra constantemente en la función sqr-iter;
;Respecto a la segunda parte de la pregunta, obtenemos que ambas expresiones funcionan correctamente. Esto ocurre debido a que el interprete peude evaluar correctamente ambas ramas del new-if, no se producen llamada a otras funciones ni operaciones susceptibles de error, si no que se evalua un entero en ambos casos;

;2) Use esta fórmula para implementar un procedimiento para calcular la raíz cúbica. ¿Cómo se podría generalizar el método de Newton en general?
(define (NEWTON x y)
  (/  (+  (/  x (* y y)) (* 2 y)) 3))

;3) Usando el modelo de substitución, describa el proceso y decir que complejidad tienen. Descríbase los procesos como iterativos o recursivos;
;El primero de los procesos es recursivo. Al ir calculando paso a paso, vemos que el tamaño de la memoria aumenta linealmente.;
;Por otra parte, el segundo proceso es iterativo, dado que siempre que se ejecuta el tamaño de la memoria permanece constante.;