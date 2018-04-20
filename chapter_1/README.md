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