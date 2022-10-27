#lang racket
;Ejercicio 1: Matriz con los numeros combinatorios.
(define (new-row-temp anterior)
  (if (null? (cdr anterior))
      (list (car anterior))
      (cons (+ (car anterior) (car (cdr anterior))) (new-row-temp (cdr anterior)))))

(define (new-row anterior)
  (cons 1 (new-row-temp anterior)))

;Ejercicio 2
(define (grado lista_nodo)
  (if (null? lista_nodo)
     0
     (+ (car lista_nodo) (grado (cdr lista_nodo)))))

(define (grado-salida m)
  (if (null? m)
      null
      (append (grado (car m)) (grado-salida (cdr m)))))

(define (transpose lista)
  (if (empty? (car lista)) empty
 (if (null? lista) empty
     (cons (map car lista) (transpose (map cdr lista))))))

;Para sacar el grado de entrada, hay que transponer la matriz y aplicar el mismo metodo grado-salida.


;EJ 4: topological sort
(require "graph.rkt")

(define (kahns-algorithm original-graph)
    (define ig (invert original-graph))
    (define g (copy-graph original-graph))
    (define L '())
    (define S (no-incoming-edges g))
    (let loop ()
      (unless (empty? S)
        (define n (first S))
        (set! L (cons n L))
        (set! S (rest S))
        (for ([m (in-list (neighbors g n))])
          (remove-edge! g n m)
          (remove-edge! ig m n)
          (when (empty? (neighbors ig n))
            (set! S (cons m S))))
        (loop)))
    (cond
      [(has-edges? g) #f]
      [else (reverse L)]))
