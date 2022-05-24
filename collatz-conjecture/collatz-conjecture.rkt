#lang racket

(define (collatz-number num) (cond
    [(even? num) (/ num 2)]
    [else (+ (* num 3) 1)]))

(define (collatz num [i 0]) (cond
    [(= num 0) (error "0")]
    [(< num 0) (error "Nonpositive number")]
    [(inexact? num) (error "inexact number")]
    [(= num 1) i]
    [else (collatz (collatz-number num) (add1 i))]))

(provide collatz)
