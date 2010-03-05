
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
    

