
(library (dharmalab indexable-sequence vector)

  (export vector-fold-left
          vector-fold-right
          vector-for-each
          vector-for-each-with-index
          vector-copy
          vector-map!
          vector-map
          vector-subseq
          vector-take
          vector-drop
          vector-filter-to-reverse-list
          vector-filter
          vector-index
          vector-find
          vector-swap!
          vector-reverse!
          vector-reverse)

  (import (except (rnrs) vector-for-each vector-map)
          (dharmalab indexable-sequence indexable-functors)
          (dharmalab indexable-sequence define-indexable-sequence-procedures))

  (define-indexable-sequence-procedures
    vector
    vector-length
    vector-ref
    vector-set!
    make-vector)

  )