#!r7rs

(import (scheme base) (scheme inexact) (scheme write))

;;;;  =========================================================================
;;;;
;;;;            L3 --- Functional programming
;;;;            2nd lab class --- Definitions given to students
;;;;
;;;;  =========================================================================
;;;;
;;;;  Author: J.-M. Hufflen
;;;;  Date: September 2021
;;;;
;;;;  =========================================================================

(define (writeln/return x)
  ;;  Fonction très utile pour pouvoir afficher un résultat suivi d'un passage
  ;;  à la ligne, tout en pouvant récupérer ce résultat dans une variable. Les
  ;;  trois expressions suivantes sont évaluées en séquence et la valeur de la
  ;;  dernière est retournée.
  (write x)
  (newline)
  x)

(define pi (* 4 (atan 1)))

(define (first-mystery n)
  ;;  Rappelons que les fonctions "quotient" et "remainder" retournent
  ;;  respectivement le quotient entier et le reste d'une division euclidienne,
  ;;  à condition, bien sûr, que le diviseur ne soit pas nul.
  (if (< n 10) n (+ (first-mystery (quotient n 10)) (remainder n 10))))

(define (second-mystery n p)
  ;;
  (define (rec-mystery n0 p0)
    ;;  Rappelons également qu'une forme spéciale "define" interne à une forme
    ;;  spéciale "lambda" est équivalente à l'utilisation d'une forme spéciale
    ;;  "letrec*".
    (if (zero? (remainder n0 p0)) (rec-mystery (quotient n0 p0) p0) n0))
  ;;
  ;;  Principal call:
  (if (or (< p 2) (zero? n)) n (rec-mystery n p)))


(define simple-surface
  (lambda (r f1)
  (f1 (* r r))))

(display "test simple-surface\n")
(writeln/return (simple-surface 10 (lambda (p) (* pi p)))); surface cercle
(writeln/return (simple-surface 10 (lambda (p) (* 4 pi p)))); surface sphère
(writeln/return (simple-surface 10 (lambda (p) (* 1 p)))); surface carré
(writeln/return (simple-surface 10 (lambda (p) (* 6 p)))); surface cube


(define (in-inches m y f i)
    (+ i (* 12
            (+ f
               (* 3
                  (+  y(* 1760 m)))))))


(define (inches-to-meters i)
    (/ (* i 25.4) 1000))

(define (british-to-metric m y f i)
    (inches-to-meters (in-inches m y f i)))


(define (to-metric nb1 nb2 nb3 metric0)
    (lambda (unit1 unit2 unit3 unit4)
      (+ metric0 (* unit4
                    (+ nb3
                      (* nb2
                        (+ unit3 )
                        (+ nb1 unit)
                        ))))))






















(define one-digit
  (lambda (x)
    (let ((y (first-mystery x)))
    (if (> y 9)
        (one-digit (remainder x 10))
        y))))
