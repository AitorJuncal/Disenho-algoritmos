#lang racket
;1) Complete el código anterior sin hacer ningún añadido innecesario.
(define (square n) (* n n))
(define (accumulate op initial sequence)
 (if (null? sequence)
     initial
     (op (car sequence)
         (accumulate op
                     initial
                     (cdr sequence)))))

(define (map p sequence) 
  (accumulate (lambda (inicial acumulado) (cons (p inicial) acumulado)) null sequence)) 

(define (append seq1 seq2) 
  (accumulate cons seq2 seq1))

(define (length sequence) 
  (accumulate (lambda (longitud) (+ 1 longitud)) 0 sequence))



;2) Explique la salida de las evaluaciones anteriores y que propiedad tiene que tener «op» para que fold-left y
;fold-right produzcan el mismo resultado. Ponga un ejemplo donde produzcan el mismo resultado y otro donde no.

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-left / 1 (list 1 2 3))
;(/ 3 (/ 2 (/ 1 1))) -> 1/1 -> 2/1 -> 3/2
(fold-right / 1 (list 1 2 3))
;(/ 1 (/ 2 (/ 3 1))) -> 3/1 -> 2/3 -> 1/6
(fold-right list nil (list 1 2 3))
;(1 (2 (3 ())))
(fold-left list nil (list 1 2 3))
;(3 (2 (1 ())))
  
;Explicación final:
;El el caso de la suma y de la multiplicación, fold-right y fold-left dan el mismo resultado puesto que en estas operaciones el orden de los operandos no altera el
;resultado final. Sin embargo, en otras operaciones como division y restar si importa el orden de los operandos.
;Ejemplo :
;2+3 = 3+2 = 5
;5*2 = 2*5 = 10
;4/2 = 2 no es igual a 2/4 = 1/2
;2-4 = -2 no es igual a 4-2 = 2

;3) Complete el código anterior y compruebe que funcione.
(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))
(reverse (list 1 2 3))

(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))
(reverse2 (list 1 2 3))