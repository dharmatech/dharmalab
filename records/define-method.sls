
(library (dharmalab records define-method)

  (export define-method)

  (import (rnrs)
          (dharmalab misc gen-id)
          (dharmalab records define-record-type))

  (define-syntax define-method
    (lambda (stx)
      (syntax-case stx ()
        ( (define-method class (method-name param ...)
            expr
            ...)
          (with-syntax ( ( import-type   (gen-id #'class "import-" #'class) )
                         ( class::method (gen-id #'class #'class "::" #'method-name) )
                         ( self          (gen-id #'class "self") )
                         ( (param ...)
                           (map (lambda (x)
                                  (gen-id #'class x))
                                #'(param ...)) ) )
            
            (syntax
             
             (define (class::method self param ...)
               (import-type self)
               expr
               ...))))))))