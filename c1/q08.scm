(define (cubic-root-iter guess guess-diff x)
    (if (good-enough? guess guess-diff)
        guess
        (cubic-root-iter (improve guess x)
                         (- (improve guess x) guess)
                         x)))

(define (good-enough? guess guess-diff)
    (< (/ (abs guess-diff) guess) 0.0001))

(define (improve guess x)
    (/ (+ (/ x (* guess guess))
          (* 2 guess))
       3))

(define (cubic-root x)
    (cubic-root-iter 1.0 1.0 x))
