#lang racket

(provide (all-defined-out))

(define (sequence low high stride) 
  (if (<= low high) 
      (cons low (sequence (+ low stride) high stride)) 
      null))

(define (string-append-map xs suffix)
  (map (lambda (x) = (string-append x suffix)) xs))

;(define (list-nth-mod xs n)
 ; (cond [< n 0] error "list-nth-mod: negative number"
  ;      [null? xs] error "list-nth-mod: empty list"
   ;     [#t] (let (i (remaider n (length xs))) 