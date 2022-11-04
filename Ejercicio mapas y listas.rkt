#lang racket

;EJERCICIO 1: COMPARAR LISTAS
(define (equal l1 l2)
  (cond
        ((and (null? l1) (null? l2)) true)
        ((or (and (pair? l1) (not (pair? l2))) (and (pair? l2) (not (pair? l1)))) false) 
        (else (and (eq? (car l1) (car l2)) (equal (cdr l1) (cdr l2))))))

;EJERCICIO 4: MAPA
(define record '((x 1) (y 2) (z 3)))
(define (assoc x record)
  (cond
       ((eq? (car (car record)) x) (cdr (car record)))
       (else (assoc x (cdr record)))))

(define (substitute a b l1)
  (if (null? l1)
      l1
  (if (eq? (car(car l1)) a)
      (cons (list a b) (substitute a b (cdr l1)))
      (cons (car l1) (substitute a b (cdr l1))))))

(define (del-entry x record)
  (cond
       ((eq? (car (car record)) x) (del-entry x (cdr record)))
       (else (list x del-entry x (cdr record)))))