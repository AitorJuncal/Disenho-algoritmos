#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))


;EJERCICIO 2: COMPARAR LISTAS
(define (equal l1 l2)
  (cond
        ((and (null? l1) (null? l2)) true)
        ((or (and (pair? l1) (not (pair? l2))) (and (pair? l2) (not (pair? l1)))) false) 
        (else (and (eq? (car l1) (car l2)) (equal (cdr l1) (cdr l2))))))

;EJERCICIO 4: MAPA
(define record '((x 1) (y 2) (z 3)))

(define (test? key pair) (eq? key (car pair)))
(define (selector key value) (lambda (x)
                               (cond [(test? key x)
                                      (list key value)]
                                    (else x)
                                  )))
(define (assoc x record)
  (cond
       ((eq? (car (car record)) x) (cdr (car record)))
       (else (assoc x (cdr record)))))

(define (add-entry key value record)
  (accumulate
   (lambda (primer_elemento acumulado_resto)
     (if (test? key primer_elemento)
         acumulado_resto
         (cons (list key value) (cons primer_elemento (cdr acumulado_resto)))))
     (list (list key value))
     record))

(define (substitute a b l1)
  (if (null? l1)
      l1
  (if (eq? (car(car l1)) a)
      (cons (list a b) (substitute a b (cdr l1)))
      (cons (car l1) (substitute a b (cdr l1))))))
(define (del-entry key record)
  (accumulate
   (lambda (f g) (if (test? key f) g (cons f g)))
   null
   record))