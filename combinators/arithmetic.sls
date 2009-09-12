
(library (dharmalab combinators arithmetic)

  (export add sub-from sub mul divide divide-by)

  (import (rnrs)
          (dharmalab misc curry)
          (dharmalab combinators concatenative))

  (define add (curry (+ x y)))

  (define sub-from (curry (- x y)))

  (define sub (curry ((swap -) x y)))

  (define mul (curry (* x y)))

  (define divide (curry (/ x y)))

  (define divide-by (curry ((swap /) x y)))

  )