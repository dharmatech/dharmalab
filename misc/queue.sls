
(library (dharmalab misc queue)

  (export new-queue queue-empty? queue-insert queue-remove queue-length)

  (import (rnrs)
          (srfi :41 streams))

  (define-record-type queue (fields L R P))

  (define (new-queue)
    (make-queue (stream) (stream) (stream)))

  (define (queue-empty? q)
    (let ((L (queue-L q))
          (R (queue-R q))
          (P (queue-P q)))
      (and (stream-null? L)
           (stream-null? R)
           (stream-null? P))))

  (define (queue-length q)
    (let ((L (queue-L q))
          (R (queue-R q)))
      (+ (stream-length L)
         (stream-length R))))

  (define (rot L R A)
    (if (stream-null? L)
        (stream-cons (stream-car R) A)
        (stream-cons (stream-car L)
                     (rot (stream-cdr L)
                          (stream-cdr R)
                          (stream-cons (stream-car R) A)))))

  (define (makeq q)
    (let ((L (queue-L q))
          (R (queue-R q))
          (P (queue-P q)))
      (if (not (stream-null? P))
          (make-queue L R (stream-cdr P))
          (let ((P (rot L R (stream))))
            (make-queue P (stream) P)))))

  (define (queue-insert q e)
    (let ((L (queue-L q))
          (R (queue-R q))
          (P (queue-P q)))
      (makeq (make-queue L (stream-cons e R) P))))

  (define (queue-remove q f)
    (let ((L (queue-L q))
          (R (queue-R q))
          (P (queue-P q)))
      (f (stream-car L)
         (makeq (make-queue (stream-cdr L) R P)))))

  )

