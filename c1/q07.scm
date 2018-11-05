(define (sqrt-iter guess guess-diff x)
    (if (good-enough? guess guess-diff)
        guess
        (sqrt-iter (improve guess x) (- (improve guess x) guess)
                   x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess guess-diff)
    (< (/ (abs guess-diff) guess) 0.0001))

(define (sqrt x)
    (sqrt-iter 1.0 1.0 x))
