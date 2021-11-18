#!r7rs

(import (scheme base) (scheme inexact) (scheme write))

(define fct1
  (lambda (x) (* x x)))

(write fct1)
(newline)
(write(fct1 2021))
(newline)
(newline)

(define fct2
  (lambda (x y) (* x y y)))

(write fct2)
(newline)
(write(fct2 2021))
(newline)
(newline)

(define fct3
  (lambda (x y) (* x y y)))

(write fct3)
(newline)
(write(fct3 2021 2020))
(newline)
(newline)

(define fct4
  (lambda (x y) (* x y y)))

(write fct4)
(newline)
(write(fct4 2021 2020 2019))
(newline)
(newline)
