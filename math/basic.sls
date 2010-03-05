
(library (dharmalab math basic)

  (export pi
          square
          add
          multiply-by
          subtract-from
          subtract
          divide
          divide-by
          greater-than
          greater-than=
          less-than
          less-than=)

  (import (rnrs)
          (dharmalab misc extended-curry))

  (define pi  3.14159265358979323846)

  (define (square n) (* n n))

  (define add           (curry + a b))

  (define multiply-by   (curry * a b))

  (define subtract-from (curry - a b))

  (define subtract      (curry - b a))

  (define divide        (curry / a b))

  (define divide-by     (curry / b a))

  (define greater-than  (curry >  b a))
  (define greater-than= (curry >= b a))

  (define less-than     (curry <  b a))
  (define less-than=    (curry <= b a))

  (define =to (curry = a b))

  )