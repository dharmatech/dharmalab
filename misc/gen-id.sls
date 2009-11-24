
(library (dharmalab misc gen-id)

  (export gen-id)

  (import (rnrs))

  (define (gen-id template-id . args)
    (datum->syntax template-id
      (string->symbol
       (apply string-append
	      (map (lambda (x)
		     (if (string? x)
			 x
			 (symbol->string (syntax->datum x))))
		   args)))))

  )