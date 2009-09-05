
(library (dharmalab misc curry)

  (export curry)

  (import (rnrs))

  (define-syntax curry
    (syntax-rules ()
      ((curry (f x)) f)
      ((curry (f x y ...))
       (lambda (x)
         (curry ((lambda (y ...)
                   (f x y ...))
                 y ...))) )))

  )