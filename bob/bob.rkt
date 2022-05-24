#lang racket

(define
    [response-for raw-phrase]
        (let*
            ([phrase (string-trim raw-phrase)]
            [is-question? (string-suffix? phrase "?")]
            [is-shouting?
                (for/fold
                    ([has-capital #f]
                    [has-no-lowercase #t]
                    #:result (and has-capital has-no-lowercase))
                 ([c (string->list phrase)])
        (values
            (or has-capital (char-upper-case? c))
            (and has-no-lowercase (not (char-lower-case? c))))) ])
        (cond
            [(equal? (non-empty-string? phrase) #f) "Fine. Be that way!"]
            [is-shouting? (if is-question?
                "Calm down, I know what I'm doing!"
                "Whoa, chill out!")]
            [is-question? "Sure."]
            [else "Whatever."])))

(provide response-for)
