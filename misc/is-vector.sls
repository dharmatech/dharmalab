
(library (dharmalab misc is-vector)

  (export is-vector)

  (import (rnrs) (dharmalab misc gen-id))

  (define-syntax is-vector

    (lambda (stx)

      (syntax-case stx ()

	((is-vector name)

	 (with-syntax ( (name.ref      (gen-id #'name #'name ".ref"))
			(name.set!     (gen-id #'name #'name ".set!"))
			(name.length   (gen-id #'name #'name ".length"))
			(name.map      (gen-id #'name #'name ".map"))
			(name.for-each (gen-id #'name #'name ".for-each")) )

	   #'(begin

	       (define (name.ref i) (vector-ref name i))

	       (define (name.set! i val) (vector-set! name i val))

	       (define (name.length) (vector-length name))

	       (define (name.map proc) (vector-map proc name))

	       (define (name.for-each proc) (vector-for-each proc name))))))))

  )