
(library (dharmalab indexable-sequence f32-vector)

  (export make-f32-vector
          f32-vector-length
          f32-vector-ref
          f32-vector-set!
          f32-vector
          
          f32-vector-fold-left
          f32-vector-fold-right
          f32-vector-for-each
          f32-vector-for-each-with-index
          f32-vector-copy
          f32-vector-map!
          f32-vector-map
          f32-vector-subseq
          f32-vector-take
          f32-vector-drop
          f32-vector-filter-to-reverse-list
          f32-vector-filter
          f32-vector-index
          f32-vector-find
          f32-vector-swap!
          f32-vector-reverse!
          f32-vector-reverse)

  (import (rnrs)
          (dharmalab indexable-sequence indexable-functors)
          (dharmalab indexable-sequence define-indexable-sequence-procedures))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (make-f32-vector n)
    (make-bytevector (* 4 n)))

  (define (f32-vector-length bv)
    (/ (bytevector-length bv) 4))

  (define (f32-vector-ref bv i)
    (bytevector-ieee-single-native-ref bv (* i 4)))

  (define (f32-vector-set! bv i val)
    (bytevector-ieee-single-native-set! bv (* i 4) val))

  (define (f32-vector . lst)
    (let ((bv (make-f32-vector (length lst))))
      (let loop ((i 0) (lst lst))
        (cond ((null? lst) bv)
              (else
               (f32-vector-set! bv i (car lst))
               (loop (+ i 1) (cdr lst)))))))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define-indexable-sequence-procedures
    f32-vector
    f32-vector-length
    f32-vector-ref
    f32-vector-set!
    make-f32-vector)

  )