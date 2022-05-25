#lang racket

(provide make-score-hash score)

(define
  (make-score-pair score)
  (lambda (character)
    `(,(char-downcase character) . ,score)))

(define/contract (make-score-hash scores)
  (-> list? any)
  (make-immutable-hash (foldl
    (lambda
      (score-pair acc)
      (append acc (map
        (make-score-pair (car score-pair)) (string->list (cdr score-pair)))))
    '() scores)))

(define (score word)
  (let
    ([score-hash (make-score-hash
     '([1 . "AEIOULNRST"]
       [2 . "DG"]
       [3 . "BCMP"]
       [4 . "FHVWY"]
       [5 . "K"]
       [8 . "JX"]
       [10 . "QZ"]))])
    (foldl
      (lambda
        (letter score)
        (+ score (hash-ref
          score-hash (char-downcase letter))))
      0 (string->list word))))
