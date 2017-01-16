;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Lab1P1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (sum-up-D n)
  (sum-up-D- n 0))

(define (sum-up-D- n partial-sum)
  (if (positive? n)
      (sum-up-D- (- n 1) (+ partial-sum n))
      partial-sum))
(sum-up-D 4)