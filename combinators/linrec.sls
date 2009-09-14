
(library (dharmalab combinators linrec)

  (export linrec)

  (import (rnrs))

  (define (linrec f g h i)

    (define (fun x)
      (if (f x)
          (g x)
          (i x
             (fun (h x)))))

    fun)

  )

