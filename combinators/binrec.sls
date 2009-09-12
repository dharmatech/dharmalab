
(library (dharmalab combinators binrec)

  (export binrec)

  (import (rnrs))

  (define (binrec f g h i j)
    (lambda (x)
      (if (f x)
          (g x)
          (j ((binrec f g h i j) (h x))
             ((binrec f g h i j) (i x))))))

  )