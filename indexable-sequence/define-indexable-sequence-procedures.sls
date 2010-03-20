
(library (dharmalab indexable-sequence define-indexable-sequence-procedures)

  (export define-indexable-sequence-procedures)

  (import (rnrs)
          (dharmalab misc gen-id)
          (dharmalab indexable-sequence indexable-functors))

  (define-syntax define-indexable-sequence-procedures

    (lambda (stx)

      (syntax-case stx ()

        ((_ type type-length type-ref type-set! new-of-size)

         (with-syntax ((type-fold-left              (gen-id #'type #'type "-fold-left"))
                       ;; (type-to-reverse-list     (gen-id #'type #'type "-reverse-list"))
                       (type-fold-right             (gen-id #'type #'type "-fold-right"))
                       (type-for-each               (gen-id #'type #'type "-for-each"))
                       (type-for-each-with-index    (gen-id #'type #'type "-for-each-with-index"))
                       (type-copy                   (gen-id #'type #'type "-copy"))
                       (type-map-to-reverse-list    (gen-id #'type #'type "-map-to-reverse-list"))
                       (type-from-reverse-list      (gen-id #'type #'type "-from-reverse-list"))
                       (type-map!                   (gen-id #'type #'type "-map!"))
                       (type-map                    (gen-id #'type #'type "-map"))
                       (type-subseq                 (gen-id #'type #'type "-subseq"))
                       (type-take                   (gen-id #'type #'type "-take"))
                       (type-drop                   (gen-id #'type #'type "-drop"))
                       (type-filter-to-reverse-list (gen-id #'type #'type "-filter-to-reverse-list"))
                       (type-filter                 (gen-id #'type #'type "-filter"))
                       (type-index                  (gen-id #'type #'type "-index"))
                       (type-find                   (gen-id #'type #'type "-find"))
                       (type-swap!                  (gen-id #'type #'type "-swap!"))
                       (type-reverse!               (gen-id #'type #'type "-reverse!"))
                       (type-reverse                (gen-id #'type #'type "-reverse")))

           #'(begin

               (define type-fold-left              (make-indexable-fold-left type-length type-ref))
               ;; (define type-to-reverse-list        (make-indexable-to-reverse-list type-length type-ref))
               (define type-fold-right             (make-indexable-fold-right type-length type-ref))
               (define type-for-each               (make-indexable-for-each type-length type-ref))
               (define type-for-each-with-index    (make-indexable-for-each-with-index type-length type-ref))
               (define type-copy                   (make-indexable-copy type-length type-ref type-set! new-of-size))
               (define type-map!                   (make-indexable-map! type-length type-ref type-set!))
               (define type-map                    (make-indexable-map type-length type-ref type-set! type-copy))
               (define type-subseq                 (make-indexable-subseq type-length type-ref type-set! new-of-size))
               (define type-take                   (make-indexable-take type-subseq))
               (define type-drop                   (make-indexable-drop type-length type-subseq))
               (define type-filter-to-reverse-list (make-indexable-filter-to-reverse-list type-length type-ref))
               (define type-filter                 (make-indexable-filter type-length type-ref type-set! new-of-size))
               (define type-index                  (make-indexable-index type-length type-ref))
               (define type-find                   (make-indexable-find type-length type-ref))
               (define type-swap!                  (make-indexable-swap! type-ref type-set!))
               (define type-reverse!               (make-indexable-reverse! type-length type-swap!))
               (define type-reverse                (make-indexable-reverse type-copy type-reverse!))

               ))))))

  )


