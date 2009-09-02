
(library (dharmalab misc if)

  (export if)

  (import (rename (rnrs) (if rnrs:if)))

  (define-syntax if

    (syntax-rules (-> =>)

      ( (if test -> var then else)

        (let ((var test))

          (rnrs:if var then else)) )

      ( (if test -> var then)

        (let ((var test))

          (rnrs:if var then)) )

      ( (if test => then else)

        (let ((val test))

          (rnrs:if val (then val) else)) )

      ( (if test => then)

        (let ((val test))

          (rnrs:if val (then val))) )

      ( (if test then else)

        (rnrs:if test then else) )

      ( (if test then)

        (rnrs:if test then) )))

  )

      

      

      