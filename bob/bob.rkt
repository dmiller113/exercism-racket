#lang racket

(define
    [response-for raw-phrase]
        (let ([phrase (string-trim raw-phrase)])
        (match (list
            (false? (non-empty-string? phrase))
            (string-suffix? phrase "?")
            (for/fold
                ([has-capital #f]
                [has-no-lowercase #t]
                #:result (and has-capital has-no-lowercase))
                ([c (string->list phrase)])
            (values
                (or has-capital (char-upper-case? c))
                (and has-no-lowercase (not (char-lower-case? c))))))
         ((list #t _ _) "Fine. Be that way!")
         ((list _ #t #t) "Calm down, I know what I'm doing!")
         ((list _ #f #t) "Whoa, chill out!")
         ((list _ #t #f) "Sure.")
         (_ "Whatever."))))

(provide response-for)
