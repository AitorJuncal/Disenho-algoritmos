#lang racket
(define (gen-list a) (cons a null))
(define (append-element a l) (cons a null))
(append-element  3 (append-element  2 (gen-list 1)))

(define (new-append l1 l2) if (null? (cdr l1)) (append-element(car l1) l2))