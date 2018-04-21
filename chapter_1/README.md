## Exercise 1.1

```scheme
> 10
10

> (+ 5 3 4)
12

> (/ 6 2)
3

> (+ (* 2 4) (- 4 6))
6

> (define a 3)
>

> (define b (+ a 1))
>

> (+ a b (* a b))
> 19

> (= a b)
#f

> (if (and (> b a) (< b (* a b)))
	  b
	  a)
4

> (cond ((= a 4) 6)
		((= b 4) (+ 6 7 a))
		(else 25))
16

> (+ 2 (if (> b a) b a))
6

> (* (cond ((> a b) a)
		   ((< a b) b)
		   (else -1))
	 (+ a 1))
16
```

## Exercise 1.2

```scheme
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
```

## Exercise 1.3

```scheme
(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-two-larger-squares x y z)
  (cond ((and (>= x y) (>= z y)) (sum-of-squares x z))
        ((and (>= y x) (>= z x)) (sum-of-squares y z))
        ((and (>= x z) (>= y z)) (sum-of-squares x y))))
```

## Exercise 1.4

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```
像 `+` `-` 这样的运算符关联于能完成相应操作的机器指令序列，可作为运算对象

## Exercise 1.5

```scheme
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

```

采用应用序求值，会进入死循环，因为其求值过程会立即执行。而正则序则不会

## Exercise 1.6

```scheme
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
  	  guess
	  (sqrt-iter (improve guess x)
		     x)))			 
```
空间不足，程序终止， `new-if` 的两个分支 `then-clause` 和 `else-clause` 都被执行

## Exercise 1.7

```scheme
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? old-guess new-guess)
  (> 0.01
     (/ (abs (- new-guess old-guess))
        old-guess))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))
```

## Exercise 1.8

```scheme
(define (cube-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-iter (improve guess x)
	  	 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (+ guess guess))
     3))

(define (good-enough? old-guess new-guess)
  (> 0.01
     (/ (abs (- new-guess old-guess))
	old-guess)))

(define (square x)
  (* x x))

(define (cube-root x)
  (cube-iter 1.0 x))
```

## Exercise 1.9

线性递归
```scheme
(+ 4 5)
(inc (+ (dec 4) 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9
```

线性迭代
```scheme
(+ 4 5)
(+ (dec 4) (inc 5))
(+ (dec 3) (inc 6))
(+ (dec 2) (inc 7))
(+ (dec 1) (inc 8))
(+ 0 9)
9
```
## Exercise 1.10

```scheme
(define (A x y)
  (cond ((= y 0) 0)
  	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))
```

```scheme
> (A 1 10)
1024

> (A 2 4)
65536

> (A 3 3)
65536

> (define (f n) (A 0 n)) ;2n

> (define (g n) (A 1 n)) ;2**n

> (define (h n) (A 2 n)) ;16**n ?
```

## Exercise 1.11
递归计算过程
```scheme
(define (f n)
  (cond ((< n 3) n)
  	(else (+ (f (- n 1))
		 (* 2 (f (- n 2)))
		 (* 3 (f (- n 3)))))))
```

迭代计算过程
```scheme
(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a
	         (+ b b)
	         (+ c c c)) a b (- count 1))))
```

## Exercise 1.12
```scheme
(define (pascal row col)
  (cond ((> col row) (error "unvalid col value"))
	((or (= col 0) (= row col)) 1)
	(else (+ (pascal (- row 1) (- col 1))
		 (pascal (- row 1) col)))))
```

## Exercise 1.13
[see](http://sicp.readthedocs.io/en/latest/chp1/13.html)
