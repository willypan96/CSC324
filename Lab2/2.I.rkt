;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2.I) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; CSC324 2017W Lab : The Design Process, and More Recursion on Lists
; ==================================================================

; ★ List Functions ★

; Here are example uses of some more list functions you should use in this part:

; ‘append’ takes any number of lists and appends them into one list.
;(check-expect (append (list 1 2) (list 3 4 5) (list 6)) (list 1 2 3 4 5 6))
;(check-expect (append (list 1 2) (list) (list 3 4 5)) (list 1 2 3 4 5))

; ‘list*’ takes any number of values and a list, and produces a version of the list with
;  the values included at the front.
;(check-expect (list* 1 2 (list 3 4)) (list 1 2 3 4))
;(check-expect (list* 1 (list)) (list 1))

; ★★★ include-in-all ★★★

; Complete the function ‘include-in-all’ that takes a value and a list of lists, and produces
;  a version of the list with the value included at the front of each of its lists.
;
; Follow the test cases and instructions below.

; ★ An Expected Result ★

(check-expect (include-in-all 10
                              (list (list 1 2 3)
                                    (list 4)
                                    (list)
                                    (list 5 6)))
              (list (list 10 1 2 3)
                    (list 10 4)
                    (list 10)
                    (list 10 5 6)))

; ★ Partial Design ★

; A test case checking that building the above result a certain way correctly produces it.

(check-expect (list* (list* 10 (list 1 2 3))
                     (list (list 10 4)
                           (list 10)
                           (list 10 5 6)))
              (list (list 10 1 2 3)
                    (list 10 4)
                    (list 10)
                    (list 10 5 6)))

; A test case recording that as a “partial design” of an algorithm for the function.

; Notice that the expected value expression was created by someone who:
;   • inspected the list argument
;   • manually decomposed the list argument
;   • manually performed ‘include-in-all’ on part of the list argument
(check-expect (include-in-all 10
                              (list (list 1 2 3)
                                    (list 4)
                                    (list)
                                    (list 5 6)))
              (list* (list* 10 (list 1 2 3))
                     (list (list 10 4)
                           (list 10)
                           (list 10 5 6))))

; ★ Fuller Design ★

; Fix the following to be a “full[er] design” test case: replace the “expected” result with
;  an expression that follows the previous “partial design” but doesn't rely on *you* seeing
;  what is in the list, except that you know it is not empty [which is why this technically
;  isn't a “full” design].
; In other words: the expression must only mention the arguments as a whole.
; Hint: it's recursive! Use ‘include-in-all’ in the expression.

(check-expect (include-in-all 10
                              (list (list 1 2 3)
                                    (list 4)
                                    (list)
                                    (list 5 6)))
              (list* (list* 10 (list 1 2 3))
                     (list (list 10 4)
                           (list 10)
                           (list 10 5 6))))

; ★ Implementation ★

; Implement the function according to your fuller design.

(define (include-in-all an-element lists)
  ;(list)
  (if (empty? lists)
      (list)
      ;Compared to (list* an-element lists)
      (list* (list* an-element (first lists)) (include-in-all an-element (rest lists)))
      ))


; ★★★ sub-sequences ★★★

; Complete the function ‘sub-sequences’ that takes a list, and produces a list of lists where
;  each list in the result is a list of some [possibly none, possibly all] elements from the
;  original list, in the same order.
;
; Follow the test cases and instructions below.

; ★ Some Expected Results ★

(check-expect (sub-sequences (list 2 3))
              (list
               (list) (list 3)
               (list 2) (list 2 3)))

(check-expect (sub-sequences (list 1 2 3))
              (list
               (list) (list 3) (list 2) (list 2 3)
               (list 1) (list 1 3) (list 1 2) (list 1 2 3)))

; ★ Fuller Design ★

; 1. Explain in words the algorithm suggested by the previous test cases.
;
;
;
;
;
; 2. Fix the following to be a fuller design test case, using ‘include-in-all’:
#|
(check-expect (sub-sequences (list 1 2 3))
              (list
               (list) (list 3) (list 2) (list 2 3)
               (list 1) (list 1 3) (list 1 2) (list 1 2 3)))
|#
(check-expect (sub-sequences (list 1 2 3))
              (append
               (list (list) (list 3) (list 2) (list 2 3))
               (include-in-all (list (list) (list 3) (list 2) (list 2 3)))))


; ★ Implementation ★

; Implement the function according to your fuller design.

(define (sub-sequences a-list)
  ;(list)
  (if (empty? list)
      (list)
  (append (sub-sequences (rest list)) (include-in-all (first list) (sub-sequences (rest list)))))
  )
