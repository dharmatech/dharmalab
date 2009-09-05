
(library (dharmalab combinators short-circuit-macros)

  (export &&)

  (import (rnrs))

  (define-syntax &&
    (syntax-rules ()
      ( (&& (f ...) (x ...))
        (lambda (x ...)
          (and (f x ...)
               ...)) )
      ( (&& (f ...))
        (&& (f ...) (x)) )))

  )