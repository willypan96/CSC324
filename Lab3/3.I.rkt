;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 3.I) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; CSC324 2017W Lab : More HOF Practice
; ====================================

; Implement ‘Filter’, to behave like ‘filter’, using ‘map’ and ‘apply’.
(check-expect (Filter even? (list 3 2 4 1 2 3))
              (filter even? (list 3 2 4 1 2 3)))

; Reminder for ‘filter’:
(check-expect (filter even? (list 3 2 4 1 2 3))
              (list 2 4 2))

; Partial Design for ‘Filter’:
(check-expect (filter even? (list 3 2 4 1 2 3))
              (append (list 2) (list 4) (list 2)))

(check-expect (filter even? (list 3 2 4 1 2 3))
              (apply append (list (list 2) (list 4) (list 2))))

(check-expect (filter even? (list 3 2 4 1 2 3))
              (apply append (map (λ (e) (if (even? e) (list e)(list))) (list 3 2 4 1 2 3))))              

(define (Filter pred a-list)
  (apply append (map (λ (e) (if (pred e) (list e)(list))) a-list))
  )

; ★ Replace ‘'change-me’ with an expression to make this work:
(check-expect (filter even? (list 3 2 4 1 2 3))
              (local [(define _ 'change-me)]
                (append _ (list 2) (list 4) _ (list 2) _)))

; ★ Replace ‘'change-me’ with an expression to make this work:
(check-expect (filter even? (list 3 2 4 1 2 3))
              (local [(define f 'change-me)]
                (append (f 3) (f 2) (f 4) (f 1) (f 2) (f 3))))

; ★ Replace ‘'change-me’ to implement ‘Filter’:
(define (Filter p l)
  'change-me)
