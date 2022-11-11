#lang racket
(list "a" (list "b" "c"))
(define (pila x) (cons x null))
(define (anhade-pila x l) (append x l))
(define (desapila l)
  (cond ((null? l) "Error")
        (null? (cdr l) (car l))
        (else (desapila (cdr l)))))