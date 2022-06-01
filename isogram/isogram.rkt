#lang racket

(provide isogram?)

(define (isogram? s)
  (letrec (
    [inner-fn (lambda (letters letter-hash result)
      (cond
        [(false? result) result]
        [(null? letters) result]
        [else (let [(letter (car letters))] (inner-fn
          (cdr letters)
          (hash-set letter-hash letter #t)
          (and result (not (hash-has-key? letter-hash letter)))))]))])
    (let ([string-list (string->list (regexp-replace* #px"\\W" (string-downcase s) ""))])
      (inner-fn
        string-list
        (make-immutable-hash null)
        #t))))
