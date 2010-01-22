
(library (dharmalab misc limit-call-rate)

  (export limit-call-rate)

  (import (rnrs)
          (srfi :19 time))

  (define (current-time-in-nanoseconds)
    (let ((val (current-time)))
      (+ (* (time-second val) 1000000000)
         (time-nanosecond val))))

  ;; (define-syntax limit-call-rate
  ;;   (syntax-rules ()
  ;;     ((limit-call-rate calls-per-second (proc param ...))
  ;;      (let ((last-call-time 0)
  ;;            (nanoseconds-per-call (/ 1e9 calls-per-second)))
  ;;        (define (nanoseconds-since-last-call)
  ;;          (- (current-time-in-nanoseconds)
  ;;             last-call-time))
  ;;        (lambda (param ...)
  ;;          (if (> (nanoseconds-since-last-call) nanoseconds-per-call)
  ;;              (begin
  ;;                (set! last-call-time (current-time-in-nanoseconds))
  ;;                (proc param ...))))))))

  (define-syntax limit-call-rate
    (syntax-rules ()
      ((limit-call-rate calls-per-second (proc param ...))
       (let ((last-call-time 0)
             (nanoseconds-per-call (lambda ()
                                     (/ 1e9 calls-per-second))))
         (define (nanoseconds-since-last-call)
           (- (current-time-in-nanoseconds)
              last-call-time))
         (lambda (param ...)
           (if (> (nanoseconds-since-last-call) (nanoseconds-per-call))
               (begin
                 (set! last-call-time (current-time-in-nanoseconds))
                 (proc param ...))))))))

  )

          