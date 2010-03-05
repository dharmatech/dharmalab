
(library (dharmalab test)

  (export test)

  (import (rnrs)
          (srfi :64)
          (dharmalab math basic))

  (define (test)

    (test-begin "dharmalab")

    (test-equal "greater-than - a"
                
                ((greater-than 5) 6)

                #t)

    (test-equal "greater-than - b"
                
                ((greater-than 5) 4)

                #f)

    (test-end "dharmalab")
    
    )
  )

  

  
