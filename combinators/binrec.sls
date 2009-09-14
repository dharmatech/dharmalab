
(library (dharmalab combinators binrec)

  (export binrec)

  (import (rnrs))

  (define (binrec f g h i j)
    (define (fun x)
      (if (f x)
          (g x)
          (j (fun (h x))
             (fun (i x)))))
    fun)

  )