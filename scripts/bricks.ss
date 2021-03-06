;;
;;

(define-record-type (rgba mkrgba isrgba)
  (fields (mutable r r@ r!) (mutable g g@ g!)
    (mutable b b@ b!) (mutable a a@ a!)))

(define solid-colour 
 (lambda (c)
   (list (r@ c) (g@ c) (b@ c) 1.0)))

(define trans-colour 
 (lambda (c t)
   (list (r@ c) (g@ c) (b@ c) t)))

(define-record-type (brick mkbrick brick?)
  (fields  
    (mutable w w@ w!) (mutable h h@ h!) 
	  (mutable c c@ c!) (mutable s s@ s!)))
 
(define yellow-brick 
	(mkbrick 80.0 20.0 (mkrgba 1.0 1.0 0.1 1.0) 10.0))

(define draw-brick 
 (lambda (b x y)
	(when (brick? b)
		(apply add-line-colour (solid-colour (c@ b))) 
		(apply add-fill-colour (trans-colour (c@ b) 0.7)) 
		(add-fill-rect x y (+ x (w@ b)) (+ y (h@ b)))
		(add-draw-rect x y (+ x (w@ b)) (+ y (h@ b))))))



(image-size 800 600)  
(clear-image 0.1 0.1 0.5 1.0)

(draw-brick yellow-brick 25.0 25.0)
(draw-brick yellow-brick 115.0 25.0)
(draw-brick yellow-brick 25.0 55.0)
(draw-brick yellow-brick 115.0 55.0)

(show 2)


 