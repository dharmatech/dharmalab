
(library (dharmalab misc is-list)

  (export is-list)

  (import (rnrs) (dharmalab misc gen-id))

  (define-syntax is-list

    (lambda (stx)

      (syntax-case stx ()

	((is-list name)

	 (with-syntax ( (name.ref      (gen-id #'name #'name ".ref"))
			(name.length   (gen-id #'name #'name ".length"))
			(name.map      (gen-id #'name #'name ".map"))
			(name.for-each (gen-id #'name #'name ".for-each")) )

	   #'(begin

	       (define (name.ref i) (list-ref name i))

	       (define (name.length) (length name))

	       (define (name.map proc) (map proc name))

	       (define (name.for-each proc) (for-each proc name))))))))

  )