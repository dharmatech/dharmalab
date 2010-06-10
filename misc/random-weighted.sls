
(library (dharmalab misc random-weighted)

  (export probabilities
          layers
          random-layer
          random-weighted-selector)

  (import (rnrs)
          (surfage s27 random-bits)
          (dharmalab math basic)
          (dharmalab misc list))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (probabilities weights)
    (map (divide-by (list-sum weights)) weights))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (layers probabilities)
    (list-map-indices probabilities
                      (lambda (i)
                        (list-sum-head probabilities (+ i 1)))))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (random-layer layers)
    (list-index layers (greater-than (random-real))))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (random-weighted-selector weights)
    (let ((layers (layers (probabilities weights))))
      (lambda ()
        (random-layer layers)))))