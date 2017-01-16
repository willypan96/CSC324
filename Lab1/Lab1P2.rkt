;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Lab1P2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (number-of-evens a-list)
  (if (empty? a-list)
      0 
      (+(if (even? (first a-list))
            1
            0) (number-of-evens (rest a-list)))
  ))

(define (number-of-strings a-list)
  (if (empty? a-list)
      0
      (+(if(string? (first a-list))
           1
           0)
      (number-of-strings (rest a-list)))))

(define (number-of-x a-lst pred)
  (if (empty? a-lst)
      0
      (if (pred (first a-lst))
          (+ 1
             (number-of-x (rest a-lst)
                          pred))
          (number-of-x (rest a-lst) pred)))
  )

(define (number-such-that pred a-lst)
  (if(empty? a-lst)
     0
     (+ (if (pred (first a-lst))
            1
            0)
        (number-such-that pred (rest a-lst)))))

(define (number-of-evens2 a-list)
  (number-of-x a-list even?))

;(number-of-evens2 (list 12 345 67 8 90))
;(number-such-that even? (list 1 2 3 4 5 6))
(check-expect (number-such-that even? (list 12 345 67 8 90))
              (number-of-evens (list 12 345 67 8 90)))

(check-expect (number-such-that string? (list 324 "Hello" + (list 123 "hi") "" -5.6 "bye"))
              (number-of-strings (list 324 "Hello" + (list 123 "hi") "" -5.6 "bye")))

(check-expect (number-such-that odd? (list 1 2 3 4 5))
              3)
;(number-of-strings(list 324 324 555))