#lang racket

(require racket/contract)
(provide hamming-distance)

(define/contract (hamming-distance strand1 strand2)
    (->i (
    [s1 string?]
    [s2 (s1) (and/c string? (lambda (s) (= (string-length s) (string-length s1))))])
    [result number?])
    (foldl
        (lambda (s1 s2 errors) (if (equal? s1 s2) errors (add1 errors)))
        0
        (string->list strand1)
        (string->list strand2)))