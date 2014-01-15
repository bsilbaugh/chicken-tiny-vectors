;;;
;;; Tiny Vectors Test Suite
;;;

(use tiny-vectors)

(module tiny-fp-vectors = tiny-vectors
  (import scheme chicken)
  (define E+ fp+)
  (define E- fp-)
  (define E* fp*)
  (define E/ fp/)
  (define Esqrt fpsqrt))

(import tiny-fp-vectors)

(use test)


(test-group "element access"
  (test 0.1 (vec-elem-1 (make-vec 0.1 0.2 0.3)))
  (test 0.2 (vec-elem-2 (make-vec 0.1 0.2 0.3)))
  (test 0.3 (vec-elem-3 (make-vec 0.1 0.2 0.3))))

(test-group "algebraic operations +, -, *, /"
  (test-assert (equal? (make-vec 1.1 2.2 3.3)
					   (vec+vec (make-vec 0.1 0.2 0.3)
								(make-vec 1.0 2.0 3.0))))
  (test-assert (equal? (make-vec 0.9 2.1 -0.3)
					   (vec-vec (make-vec 1.0 2.0 0.0)
								(make-vec 0.1 -0.1 0.3)))))

(test-group "dot product"
  (test  1.0  (dot (make-vec  1.0  0.0  0.0) (make-vec  1.0  0.0  0.0)))
  (test  0.0  (dot (make-vec  1.0  0.0  0.0) (make-vec  0.0  1.0  0.0)))
  (test  0.0  (dot (make-vec  1.0  0.0  0.0) (make-vec  0.0  0.0  1.0)))
  (test  0.0  (dot (make-vec  0.0  1.0  0.0) (make-vec  1.0  0.0  0.0)))
  (test  1.0  (dot (make-vec  0.0  1.0  0.0) (make-vec  0.0  1.0  0.0)))
  (test  0.0  (dot (make-vec  0.0  1.0  0.0) (make-vec  0.0  0.0  1.0)))
  (test  0.0  (dot (make-vec  0.0  0.0  1.0) (make-vec  1.0  0.0  0.0)))
  (test  0.0  (dot (make-vec  0.0  0.0  1.0) (make-vec  0.0  1.0  0.0)))
  (test  1.0  (dot (make-vec  0.0  0.0  1.0) (make-vec  0.0  0.0  1.0)))
  (test -1.0  (dot (make-vec -1.0  0.0  0.0) (make-vec  1.0  0.0  0.0)))
  (test  0.0  (dot (make-vec  0.0  0.0  0.0) (make-vec  1.0  0.0  0.0))))

(test-group "cross product"
  (test-assert (equal? (make-vec 0.0 0.0 0.0) 
					   (cross (make-vec 1.0 0.0 0.0) 
							  (make-vec 1.0 0.0 0.0))))
  (test-assert (equal? (make-vec 0.0 0.0 1.0) 
					   (cross (make-vec 1.0 0.0 0.0) 
							  (make-vec 0.0 1.0 0.0))))
  (test-assert (equal? (make-vec 0.0 -1.0 0.0) 
					   (cross (make-vec 1.0 0.0 0.0) 
							  (make-vec 0.0 0.0 1.0))))
  (test-assert (equal? (make-vec 0.0 0.0 -1.0) 
					   (cross (make-vec 0.0 1.0 0.0) 
							  (make-vec 1.0 0.0 0.0))))
  (test-assert (equal? (make-vec 0.0 0.0 0.0) 
					   (cross (make-vec 0.0 1.0 0.0) 
							  (make-vec 0.0 1.0 0.0))))
  (test-assert (equal? (make-vec 1.0 0.0 0.0) 
					   (cross (make-vec 0.0 1.0 0.0) 
							  (make-vec 0.0 0.0 1.0))))
  (test-assert (equal? (make-vec 0.0 1.0 0.0) 
					   (cross (make-vec 0.0 0.0 1.0) 
							  (make-vec 1.0 0.0 0.0))))
  (test-assert (equal? (make-vec -1.0 0.0 0.0) 
					   (cross (make-vec 0.0 0.0 1.0) 
							  (make-vec 0.0 1.0 0.0))))
  (test-assert (equal? (make-vec 0.0 0.0 0.0) 
					   (cross (make-vec 0.0 0.0 1.0) 
							  (make-vec 0.0 0.0 1.0)))))

(test-group "mag"
  (test 0.0 (mag (make-vec  0.0  0.0  0.0)))
  (test 1.0 (mag (make-vec  1.0  0.0  0.0)))
  (test 1.0 (mag (make-vec  0.0  1.0  0.0)))
  (test 1.0 (mag (make-vec  0.0  0.0  1.0)))
  (test 1.0 (mag (make-vec -1.0  0.0  0.0)))
  (test 1.0 (mag (make-vec  0.0 -1.0  0.0)))
  (test 1.0 (mag (make-vec  0.0  0.0 -1.0)))
  (test (sqrt 0.14) (mag (make-vec 0.1 -0.2 0.3))))

