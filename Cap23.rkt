#lang racket
;1) Complete el código anterior sin hacer ningún añadido innecesario.
(define (square n) (* n n)
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






;3) Complete el código anterior y compruebe que funcione.
(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))
(reverse (list 1 2 3))

(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))
(reverse2 (list 1 2 3))