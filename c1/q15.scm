(define (cube x) (* x x x))

(define (p x) (write "called") (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

;; (sine 12.15)
;; (p 4.05)
;; (p 1.35)
;; (p 0.45)
;; (p 0.15)
;; (p 0.05)
;; 5 times

;; space: O(log 10a/log 3) ~= O(log a)
;; step: O(log 10a/log 3) ~= O(log a)
