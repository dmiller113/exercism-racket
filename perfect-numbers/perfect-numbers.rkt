#lang racket

(provide classify)

(define (factor? num f) (equal? (modulo num f) 0))
(define (factors num)
  (stream-fold
    (lambda (acc i) (let
      ([other_factor (/ num i)])
      (cond
        [(or
          (not(factor? num i))
          (equal? i num)
          (not (equal? (member i acc) #f)))
            acc]
        [(or
          (equal? i 1)
          (equal? i other_factor))
            (cons i acc)]
        [else (cons (/ num i) (cons i acc))])))
    '()
    (in-range 1 (ceiling (sqrt num)))))

(define (classify x) (let
  ([total (apply + (factors x))])
  (cond
    [(equal? total x) 'perfect]
    [(< total x) 'deficient]
    [(> total x) 'abundant])))
