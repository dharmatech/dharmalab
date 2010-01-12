
(library (dharmalab misc is-vector)

  (export is-vector)

  (import (rnrs)
          (for (dharmalab misc gen-id) (meta 1))
          )

  ;; (define-syntax is-vector

  ;;   (lambda (stx)

  ;;     (syntax-case stx ()

  ;; 	((is-vector name)

  ;; 	 (with-syntax ( (name.ref      (gen-id #'name #'name ".ref"))
  ;; 			(name.set!     (gen-id #'name #'name ".set!"))
  ;; 			(name.length   (gen-id #'name #'name ".length"))
  ;; 			(name.map      (gen-id #'name #'name ".map"))
  ;; 			(name.for-each (gen-id #'name #'name ".for-each")) )

  ;; 	   #'(begin

  ;; 	       (define (name.ref i) (vector-ref name i))

  ;; 	       (define (name.set! i val) (vector-set! name i val))

  ;; 	       (define (name.length) (vector-length name))

  ;; 	       (define (name.map proc) (vector-map proc name))

  ;; 	       (define (name.for-each proc) (vector-for-each proc name))))))))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define-syntax is-vector

    (lambda (stx)

      (syntax-case stx ()

	((is-vector name j ...)

	 (with-syntax ( (name.ref      (gen-id #'name #'name ".ref"))
			(name.set!     (gen-id #'name #'name ".set!"))
			(name.length   (gen-id #'name #'name ".length"))
			(name.map      (gen-id #'name #'name ".map"))
			(name.for-each (gen-id #'name #'name ".for-each"))

			((name.j ...)
			 (map (lambda (x)
				(gen-id x #'name "." x))
			      #'(j ...)))

			((name.j! ...)
			 (map (lambda (x)
				(gen-id x #'name "." x "!"))
			      #'(j ...)))
			
			)

	   #'(begin

	       (define (name.ref i) (vector-ref name i))

	       (define (name.set! i val) (vector-set! name i val))

	       (define (name.length) (vector-length name))

	       (define (name.map proc) (vector-map proc name))

	       (define (name.for-each proc) (vector-for-each proc name))

	       (define-syntax name.j
		 (identifier-syntax
		  (vector-ref name j)))
	       ...

	       (define (name.j! val)
		 (vector-set! name j val))
	       ...
	       ))))))

  )