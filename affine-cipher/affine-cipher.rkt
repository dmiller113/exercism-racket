#lang racket
(require racket/contract)

(provide (contract-out
          [find-inverse (exact-integer?
                         exact-integer?
                         exact-integer?
                         exact-integer?
                         . -> . exact-integer?)]
          [mmi-26 ((and/c exact-nonnegative-integer? coprime-with-26?)
                   . -> . exact-nonnegative-integer?)]
          [encode (string?
                   (and/c exact-nonnegative-integer? coprime-with-26?)
                   exact-nonnegative-integer? . -> . string?)]
          [encode-char (char?
                   (and/c exact-nonnegative-integer? coprime-with-26?)
                   exact-nonnegative-integer? . -> . char?)]
          [decode (string?
                   (and/c exact-nonnegative-integer? coprime-with-26?)
                   exact-nonnegative-integer? . -> . string?)]
          [coprime-with-26? (exact-nonnegative-integer? . -> . boolean?)]))

(define alphabet (apply vector-immutable (string->list "abcdefghijklmnopqrstuvwxy")))

(define (encode-char letter a b)
  (vector-ref alphabet (modulo (+ b (* a (vector-member letter alphabet))) 26)))

(define (encode rawMsg a b)
  (let ([msg (regexp-replace* #px"\\s" rawMsg "")]) msg))

(define (decode rawMsg a b)
  (let ([msg (regexp-replace* #px"\\s" rawMsg "")]) msg))

(define (coprime-with-26? num) (= 1 (gcd num 26)))

(define (mmi-26 a) (let*
  ([n 26]
   [raw-inverse (find-inverse n a 0 1)])
   (if (< raw-inverse 0) (+ raw-inverse n) raw-inverse)))

(define (find-inverse r newR t newT) (cond
  [(= newR 0) t]
  [else (let
    ([quotient-of (quotient r newR)])
    (find-inverse newR (- r (* newR quotient-of)) newT (- t (* newT quotient-of)))
    )]))