
(library (dharmalab combinators linrec)

  (export linrec)

  (import (rnrs))

  (define (linrec f g h i)
    (lambda (x)
      (if (f x)
          (g x)
          (i x
             ((linrec f g h i) (h x))))))

  )

