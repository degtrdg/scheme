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

;Recursive and iterative factorial


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


;Ackermann function
(define (A x y)
    (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	 ((= y 1) 2)
	  (else (A (- x 1)
		(A x (- y 1))))))

;(define (f n)
;  (A 0 n))
;;2n
;;(f 4)
;
;(define (g n)
;  (A 1 n))
;;2^n
;
;
;(define (h n)
;  (A 2 n))

;Fib recursive and iterative

;(define (fib n)
;  (if (< n 2)
;    n
;    (+ (fib (- n 1)) (fib (+ n 1)))))
;
;(fib 2)

(define (fib n)
  ; we need to have an iterative fib
  ; idk how to do this
  (define (fib-iter fir sec counter)
    (if (= n counter)
      fir 
      (fib-iter sec (+ fir sec)(+ counter 1))))
  (fib-iter 0 1 0))
 
;(fib 100)



  
; tower of hanoi Is there an iterative way to do this?  
  (define (move n from to spare)
      (cond ((= n 0) "Done")
	    ((= n 1) (begin
		       (display "Move from ")
		       (display from)
		       (display " to ")
		       (display to)
		       (display " with ")
		       (display spare)
		       (display " as a spare ")
		       (newline)
		       ))
	    (else (begin
		       (move (- n 1) from spare to)
		       (move 1 from to spare)
		       (move (- n 1) spare to from)
		       )

		  )))

;(move 6 "A" "C" "B")

(define (change n p)
  (define (denom x)
    (cond ((= x 1) 1)
	  ((= x 2) 5)
	  ((= x 3) 10)
	  ((= x 4) 25)
          ((= x 5) 50)))
  (cond ((= n 0) 1)
	((< n 0) 0)
	((= p 0) 0)
	(else (+ (change (- n (denom p)) p) (change n (- p 1)))))
  )

;(change 30 5)



;1.11

;f(n)=n if n<3
;f(n)=f(n−1)+2f(n−2)+3f(n−3) if n>3

(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3)))))
  )
(define (f-iter n)
  (define (iter a b c counter)
    (cond ((> counter n) c)
	  (else (iter b c (+ (* 3 a) (* 2 b) c ) (+ counter 1)))))
  (if (< n 3)
    n
    (iter 0 1 2 3)))

;(f-iter 3)
;(f 3)

;1.12

;Pascal's triangle

(define (pascal row col)
  (if (or (= col 0) (= row col))
    1
    (begin (+ (pascal (- row 1) (- col 1))
	     (pascal (- row 1) col)))))

;(pascal 2 1)




















