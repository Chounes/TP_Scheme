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

;Calcule la valeur de f1 en 0 par dichotomie
(define look-for-root
  (lambda(f1 negative-point positive-point epsi)
    (let ((moy (average negative-point positive-point)))
    (if (close-enough? ( negative-point positive-point epsi))
      moy
      (if (< (f1 moy) 0) (look-for-root f1 moy positive-point epsi);if moy < 0 moy->negative-point
                   (look-for-root f1 negative-point moy epsi))))));else moy->positive-point


(define fUn
  (lambda (x)
    (- (* x x) 2)))



(display "test look-for-root?")
(newline)
(write (look-for-root (lambda(x)(- (* x x) 2)) 1 2.0))
(newline)
(newline)
