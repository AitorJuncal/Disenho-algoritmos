#lang racket
(define (new-row-temp anterior)
  (if (null? (cdr anterior))
      (list (car anterior))
      (cons (+ (car anterior) (car (cdr anterior))) (new-row-temp (cd anterior)))))

(define (new-row anterior)
  (cons 1 (new-row-temp anterior)))