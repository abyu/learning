#lang racket

(provide (all-defined-out))

(define (sequence low high stride) 
  (if (<= low high) 
      (cons low (sequence (+ low stride) high stride)) 
      null))

(define (string-append-map xs suffix)
  (map (lambda (x) = (string-append x suffix)) xs))

(define (list-nth-mod xs n)
  (cond [(< n 0) error "list-nth-mod: negative number"]
        [(null? xs) error "list-nth-mod: empty list"]
        [#t (let ([i (remainder n (length xs))]) 
               (car (list-tail xs i)))]))

(define (stream-for-n-steps s n) 
  (if (= n 0) 
      null
      (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))

(define (funny-number-stream) 
  (letrec ([f (lambda (x) 
                (cons (if (= (remainder x 5) 0) (- x) x) (lambda () (f (+ x 1)))))]) 
    (f 1)))

(define (dan-then-dog)
  (letrec ([dd (list "dan.jpg" "dog.jpg")]
           [f (lambda (x) 
                (cons (list-nth-mod dd x) (lambda () (f (+ x 1)))))])
  (f 0)))

(define (stream-add-zero s)
  (lambda ()
  (cons (cons 0 (car (s))) (lambda () (stream-add-zero (cdr (s)))))))

(define (cycle-lists xs ys)
  (letrec ([f (lambda (x) 
                (cons (cons (list-nth-mod xs x) (list-nth-mod ys x))
                               (lambda () (f (+ x 1)))))])
    (lambda () (f 0))))
