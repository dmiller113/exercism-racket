#lang racket

(provide square total)

(define (square cell_num)
    (if (equal? cell_num 1) 1
        (* 2 (square (- cell_num 1)))))
; Total of any given square size is square (size + 1) - 1
(define (total) (- (square 65) 1))