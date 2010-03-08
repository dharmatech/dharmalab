
(library (dharmalab misc list)

  (export all-are all-of any-are any-of list-tabulate)

  (import (rnrs)
          (dharmalab misc extended-curry))
  
  (define all-are (curry for-all a b)) ;; (all-are <pred>) -> (<proc> <list>)
  (define all-of  (curry for-all b a)) ;; (all-of  <list>) -> (<proc> <pred>)
  (define any-are (curry exists  a b)) ;; (any-are <pred>) -> (<proc> <list>)
  (define any-of  (curry exists  b a)) ;; (any-of  <list>) -> (<proc> <pred>)

  (define (list-tabulate n f)
    (do ((i 0 (+ i 1))
         (accum '() (cons (f i) accum)))
        ((>= i n) (reverse accum))))
  
  )