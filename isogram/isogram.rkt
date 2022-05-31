#lang racket

(provide isogram?)

(define (isogram? s)
  (cond
    [(= (string-length s) 0)] #t))
