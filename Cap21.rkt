#lang racket
(define (TRUE x y) x)
(define (FALSE x y) y)

(define (AND x y)
  (if (= x 1)
      (if (= y 1)
          (TRUE x y)
           0)
    0))

;(define (cons x y) (lambda (m) (m x y)));
(define (H p q) p)
(define (J p q) q)
(define (car z0) (z0 H))
(define (cdr z1) (z1 J))