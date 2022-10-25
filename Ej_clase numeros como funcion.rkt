#lang racket
(define zero (lambda (f) (lambda(x) x)))
(define (siguiente x) (+ x 1))
((zero siguiente) 0)
(define uno (lambda (f) (lambda (x) (f x))))
(define (uno1 f x) (f x))
(define dos (lambda (f) (lambda (x) (f (f x)))))

(define (inc n) (lambda (f) (lambda (x) (f ((n f) x)))))
(((inc uno) siguiente) 0)

(define (suma n m) (lambda (f) (lambda (x) ((((m inc) n) f) x))))
(((suma dos dos) siguiente) 0)
(define (temp2 n m) (lambda (f) (lambda (x) ( (n (m f)) x))))
(((temp2 uno dos) siguiente) 2
;A 2 le suma dos una vez.