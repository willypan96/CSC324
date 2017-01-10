#lang racket

(provide define′
         (all-from-out 2htdp/image))

(define-syntax-rule
  (define′ (<function-id>)
    <body-expression>)
  (define (<function-id>)
    <body-expression>))

(require (only-in 2htdp/image make-color above beside triangle))

