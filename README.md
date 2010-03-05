
# (dharmalab math basic) #

Constant: `pi`

    (square <number>)

Curried versions of various procedures:

    (add <number>)

    (multiply-by <number>)

    (subtract-from <number>)

    (subtract <number>)

    (divide <number>)

    (divide-by <number>)

    (greater-than  <number>)
    (greater-than= <number>)

    (less-than  <number>)
    (less-than= <number>)

# (dharmalab misc curry) #

Macro: `(curry (proc param ...))`

Create a curried version of 'vector-set!':

    > (define put (curry (vector-set! a b c)))
    > (define v0 '#(a b c d e))
    > (((put v0) 0) 'x)
    > v0
    #(x b c d e)

# (dharmalab records define-record-type) #

Macro: `define-record-type++`

Example:

<pre>
(define-record-type++ point
  (fields x y))

(define p (make-point 10 20))

(is-point p)

(list p.x p.y) ;; ---> (10 20)

(define (distance-from-origin p)
  (import-point p)
  (sqrt (+ (* x x) (* y y))))

</pre>

# (dharmalab misc time entry) #

The standard `time` macro is provided by many implementations, but
exported from different libraries. This is a common interface to it.

    (time <expression>)

# (dharmalab misc queue) #

Purely functional queue.