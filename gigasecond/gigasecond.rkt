#lang racket

(provide add-gigasecond)

(require racket/date)

(define gigasecond 1000000000)
(define (add-gigasecond d)
  (seconds->date (+ (date->seconds d) gigasecond)))
