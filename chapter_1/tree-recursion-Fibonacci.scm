;;; tree-recursion-Fibonacci.scm

(define (Fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (Fib (- n 1))
                 (Fib (- n 2))))))
