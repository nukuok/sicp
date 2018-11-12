(define (f-recursive n)
  (if (< n 3)
      n
      (+ (* 1 (f-recursive (- n 3)))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 1))))))

(define (f-iterative n)
  (define (iter a b c count)
    (if (<= count 0)
        a
        (iter b c (+ (* 1 a)
                     (* 2 b)
                     (* 3 c))
              (- count 1))))
  (iter 0 1 2 n))
