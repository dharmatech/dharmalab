
(library (dharmalab records class)

  (export class)

  (import (rnrs)
          (dharmalab misc gen-id)
          (dharmalab records define-record-type)
          (dharmalab records define-method))

  (define-syntax class

    (lambda (stx)

      (syntax-case stx ()

        ( (class class-name (field ...) ((method-name param ...) expr ...) ...)

          (with-syntax ( ( (class-name::method-name ...)
                           (map (lambda (x)
                                  (gen-id #'class-name #'class-name "::" x))
                                #'(method-name ...)) ) )

            (syntax

             (begin

               (define-record-type++ class-name
                 (fields field ...)
                 (methods
                  (method-name class-name::method-name)
                  ...))

               (define-method class-name (method-name param ...)
                 expr
                 ...)

               ...)))

          )))))