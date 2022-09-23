#lang racket


(define (fast-expt n b)
   (fast-expt-iter n b b))

(define (fast-expt-iter n b acumulado)
  (cond ((= n 0) 
         1))
  (cond ((= n 1)
         b))
  (fast-expt-iter (- n 1) b (* acumulado b)))