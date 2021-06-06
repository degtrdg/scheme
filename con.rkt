#lang racket 

;(define (square x)
;  (* x x))
;
;(define (average x y)
;  (/ (+ x y) 2))
;
;(define (sqroot x)
;  (define (improve guess)
;    (average guess (/ x guess)))
;  (define (good-enough? guess)
;    (< (abs(-(square guess) x))
;       0.001))
;  (define (try guess)
;    (if (good-enough? guess)
;      guess
;      (try (improve guess))))
;  (try 1.0))



; Basic arithmetic

(define (plus x y)
  (if (= x 0)
    y
    (plus (sub1 x) (add1 y))))

;(plus 10 1)


;(define (factorial x)
;  (if (= x 1)
;    1
;    (* x (factorial (- x 1)))))
;
;(factorial 4)

(define (factorial x)
  (define (fact-iter product counter)
    (if (> counter x)
      product
      (fact-iter (* counter product) (+ 1 counter)))
    )
  (fact-iter 1 1))

(factorial 3)


(define (A x y)
    (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	 ((= y 1) 2)
	  (else (A (- x 1)
		(A x (- y 1))))))
























