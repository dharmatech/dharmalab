
(library (dharmalab misc misc)

  (export equal-to any-are)

  (import (rnrs)
          (only (srfi :1) any)
          )

  (define (equal-to x)
    (lambda (y)
      (equal? x y)))

  (define (any-are f)
    (lambda (l)
      (any f l)))

  )