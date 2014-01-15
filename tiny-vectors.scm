;;;
;;; Tiny Vectors
;;; 
;;; A functor implementation of vector algebra in 3 dimensions.
;;;
;;; Copyright 2014 Benjamin Silbaugh

(functor (tiny-vectors (M (E+ E- E* E/ Esqrt))) *

  (import scheme chicken)
  (reexport M)
  (use tuples)

;;; Define a 3-vector as a triple

(define make-vec make-triple)
(define vec-elem-1 triple-elem-0)
(define vec-elem-2 triple-elem-1)
(define vec-elem-3 triple-elem-2)
(define vec? triple?)

;;; Define vector operations on triples

(define (vec+vec u v)
  (triple-map-bfun E+ u v))

(define (vec-vec u v)
  (triple-map-bfun E- u v))

(define (vec*sca u c)
  (triple-map-ufun (lambda (ui) (E* c ui)) u))

(define (sca*vec c u) 
  (vec*sca u c))

(define (vec/sca u c)
  (triple-map-ufun (lambda (ui) (E/ ui c)) u))

(define (dot u v)
  (triple-reduce 
   (lambda (w1 w2 w3) (E+ w1 (E+ w2 w3))) 
   (triple-map-bfun E* u v)))

(define (cross u v)
  (let ((u1 (vec-elem-1 u)) (u2 (vec-elem-2 u)) (u3 (vec-elem-3 u))
		(v1 (vec-elem-1 v)) (v2 (vec-elem-2 v)) (v3 (vec-elem-3 v)))
	(make-vec (E- (E* u2 v3) (E* u3 v2))
			  (E- (E* u3 v1) (E* u1 v3))
			  (E- (E* u1 v2) (E* u2 v1)))))

(define (mag u)
  (Esqrt (dot u u)))

);module
