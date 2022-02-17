#lang racket

(provide sum-of-squares square-of-sum difference)

; old function (for/sum ([x (in-inclusive-range 1 limit)]) (expt x 2)))
(define (sum-of-squares limit) (/ (* (* limit (add1 limit)) (add1 (* 2 limit))) 6))
; old function (expt (for/sum ([x (in-inclusive-range 1 limit)]) x) 2)
(define (square-of-sum limit) (expt (/ (* limit (add1 limit)) 2) 2))
(define (difference limit) (- (square-of-sum limit) (sum-of-squares limit)))