(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

;; (count-change 11)
;; (cc 11 5):
;; (cc 11 4): -(cc -39 5):0
;; (cc 11 3): -(cc -14 4):0
;; (cc 11 2):3--------------------------------------------------------------------------(cc 1 3):1
;; (cc 11 1):1----------------------------(cc 6 2):2                                    (cc 1 2):1-(cc -9 3):0
;; (cc 11 0):0-(cc 10 1):1                (cc 6 1):1------------(cc 1 2):1              (cc 1 1):1-(cc -4 2):0
;;             (cc 10 0):0-(cc 9 1):1     (cc 6 0):0-(cc 5 1):1 (cc 1 1):1-(cc -4 2):0  (cc 1 0):0-(cc 0 1):1
;;             (cc 9 0):0-(cc 8 1):1      (cc 5 0):0-(cc 4 1):1 (cc 1 0):0-(cc 0 1):1
;;             (cc 8 0):0-(cc 7 1):1      (cc 4 0):0-(cc 3 1):1
;;             (cc 7 0):0-(cc 6 1):1      (cc 3 0):0-(cc 2 1):1
;;             (cc 6 0):0-(cc 5 1):1      (cc 2 0):0-(cc 1 1):1
;;             (cc 5 0):0-(cc 4 1):1      (cc 1 0):0-(cc 0 1):1
;;             (cc 4 0):0-(cc 3 1):1
;;             (cc 3 0):0-(cc 2 1):1
;;             (cc 2 0):0-(cc 1 1):1
;;             (cc 1 0):0-(cc 0 1):1

;; space: O(n)
;; f(amount, 5) = f(amount - 50, 5) + f(amount - 25, 4) + f(amount - 10, 3) + f(amount - 5, 2) + f(amount - 1, 1)
;; f(amount, 1) -> O(1)
;; f(amount, 2) -> O(n)
;; f(amount, 3) -> O(n^2)
;; f(amount, 4) -> O(n^3)
;; f(amount, 5) -> O(n^4)
;; step: O(n^4)
