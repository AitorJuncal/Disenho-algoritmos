#lang racket
;1) Explicar la razón que está función no puede ser utilizada para calcular las raíces cuadradas.;
;Decir también si funcionan correctamente los siguientes códigos: (new-if (= 1 1) 0 5), (new-if (= 2 3) 0 5).s;


(define (NEWTON x y)
  (/  (+  (/  x (* y y)) (* 2 y)) 3))
