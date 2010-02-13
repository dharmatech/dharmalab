
(library (dharmalab records define-record-type)
  
  (export define-record-type++)
  
  (import (rnrs)
          (dharmalab misc gen-id)
          (dharmalab records define-is-type-syntax)
          (dharmalab records define-import-type-syntax))
  
  (define-syntax define-record-type++
    (lambda (stx)
      (syntax-case stx ()
        ((_ name-spec rest ...)

         (let loop ((r (syntax (rest ...)))
                    (f '())
                    (m '())
                    (a (quote ())))
           
           (if (null? r)

               (with-syntax (((field-name  ...) f)
                             ((method-spec ...) m)
                             ((drt-clauses ...) (reverse a))
                             (type-name (syntax-case (syntax name-spec) ()
                                          ((x . _) (syntax x))
                                          (_ (syntax name-spec)))))

                 (with-syntax ((is-type     (gen-id #'type-name "is-" #'type-name))
                               (import-type (gen-id #'type-name
                                                    "import-" #'type-name)))
                   
                   (syntax
                    (begin

                      (define-record-type name-spec drt-clauses ...)

                      (define-is-type-syntax is-type
                        type-name
                        (fields field-name ...)
                        (methods method-spec ...))
                      
                      (define-import-type-syntax import-type
                        type-name
                        (fields field-name ...)
                        (methods method-spec ...))))))
               
               (syntax-case (car r) (fields methods)

                 ((fields x ...)
                  (loop (cdr r)
                        (map (lambda (x)
                               (syntax-case x ()
                                 ((_ name . _) (syntax name))
                                 (_ x)))
                             (syntax (x ...)))
                        m
                        (cons (car r) a)))
                 
                 ((methods x ...)
                  (loop (cdr r) f (syntax (x ...)) a))
                 
                 (_
                  (loop (cdr r) f m (cons (car r) a)))

                 )

               )))))))
