#lang racket
(define (combinatorio n k)
  (cond ((> k n) 0)
        ((= n 0) 1)
        ((= k 0) 1)
        (else (+ (combinatorio (- n 1) (- k 1)) (combinatorio (- n 1) k)))))


(define lista (list 1 2 3 4))
(define (square x) (* x x))
(map square lista)