
(library (dharmalab misc list)

  (export all-are all-of any-are any-of)

  (import (rnrs)
          (dharmalab misc extended-curry))
  
  (define all-are (curry for-all a b)) ;; (all-are <pred>) -> (<proc> <list>)
  (define all-of  (curry for-all b a)) ;; (all-of  <list>) -> (<proc> <pred>)
  (define any-are (curry exists a b))  ;; (any-are <pred>) -> (<proc> <list>)
  (define any-of  (curry exists b a))  ;; (any-of  <list>) -> (<proc> <pred>)

  )