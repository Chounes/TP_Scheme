#!r7rs

(import (scheme base) (scheme inexact) (scheme write))
;;  Importation des bibliothèques prédéfinies nécessaires. Pour l'instant,
;;  retenez simplement que vous aurez toujours besoin de "base". De même, nous
;;  importerons toujours "write" pour réaliser des affichages à l'écran. Nous
;;  vous signalerons l'importation d'autres bibliothèques le cas échéant : ici,
;;  "inexact", car nous utilisons quelques fonctions trigonométriques et
;;  logarithmiques. Comme vous l'avez deviné, ceci est un commentaire.

(define crash  ;  (***)  Pour bien montrer que Scheme n'évalue pas sous la
  (lambda () (/ 0)))  ;  forme spéciale "lambda".

(define derive-wrt
  (lambda (f1 h)
    (lambda (x) (/ (- (f1 (+ x h)) (f1 x)) h))))


(define fact
  (lambda (n) (if (zero? n) 1 (* n (fact (- n 1))))))


(define pi (* 4 (atan 1)))  ;  "atan" est la fonction "Arc tangente" en Scheme.

(define power
  (lambda (U I f0) (* U I (cos (* 2 pi f0)))))

(define fq->power
  (lambda (f0)
    (let ((coefficient (cos (* 2 pi f0))))
      (lambda (U I) (* coefficient U I)))))


(define volume-at
  (lambda(t V0 lambB)
    (* V0(+ 1(* lambB t)))))

;(define body->volume-at
;  (lambda( lambda-b)
;    (lambda (t V0))))

;Calcule la myenne de x et y
(define average
  (lambda(x y)
    (/ (+ x y) 2)))


;True si l'écart entre x et y et inférieur a epsilon
(define close-enough?
  (lambda( x y epsilon)
    (< (abs (- x y)) epsilon)))


(define (dichotomy f1 r1 r2 epsilon)
  ;;
  (define (look-for-root negative-point positive-point)
    ;;  Local function.
    (let ((middle-point (average negative-point positive-point)))
      (if (close-enough? negative-point positive-point epsilon)
          middle-point
          (let ((middle-point-image (f1 middle-point)))
            (cond ((negative? middle-point-image)
                   (look-for-root middle-point positive-point))
                  ((positive? middle-point-image)
                   (look-for-root negative-point middle-point))
                  (else middle-point))))))
    ;;
    ;;  Launching:
    (let ((image-1 (f1 r1)))
      (if (negative? (* image-1 (f1 r2)))
          (if (negative? image-1) (look-for-root r1 r2) (look-for-root r2 r1))
          (begin
            (display "Can't apply the dichotomy method, sorry!")
            (newline)
            #f))))



(display "test look-for-root?")
(newline)
(write (dichotomy (lambda (x) (- (* x x) 2.0)) 1.0 2.0 1e-4))
(newline)
(newline)
