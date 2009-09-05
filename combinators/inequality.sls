
(library (dharmalab combinators inequality)

  (export greater-than
          less-than
          greater-than=
          less-than=
          =to
          not=to)

  (import (rnrs)
          (dharmalab misc curry)
          (only (dharmalab combinators macros) compose))

  (define greater-than  (curry (< x y)))
  (define less-than     (curry (> x y)))
  (define greater-than= (curry (<= x y)))
  (define less-than=    (curry (>= x y)))
  (define =to           (curry (= x y)))
  (define not=to        (compose (not =to)))
  
  )