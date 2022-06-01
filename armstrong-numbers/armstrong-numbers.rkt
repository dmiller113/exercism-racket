#lang racket

(provide armstrong-number? number->list)


(define (number->list n (acc null))
  (if (< n 1)
    acc
    (number->list (quotient n 10) (apply list (modulo n 10) acc))))

(define (armstrong-number? n) (let*
  ([digits (number->list n)]
   [armstrong-total (foldl (lambda (i acc) (+ acc (expt i (length digits)))) 0 digits)])
  (= armstrong-total n)))
