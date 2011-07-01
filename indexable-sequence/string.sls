
(library (dharmalab indexable-sequence string)

  (export string-fold-left
          string-fold-right
          string-for-each
          string-for-each-with-index
          string-copy
          string-map!
          string-map
          string-subseq
          string-take
          string-drop
          string-filter-to-reverse-list
          string-filter
          string-index
          string-find
          string-swap!
          string-reverse!
          string-reverse)

  (import (except (rnrs) string-for-each string-copy)
          (rnrs mutable-strings)
          (dharmalab indexable-sequence indexable-functors)
          (dharmalab indexable-sequence define-indexable-sequence-procedures))

  (define-indexable-sequence-procedures
    string
    string-length
    string-ref
    string-set!
    make-string))
