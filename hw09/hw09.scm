(define (curry-cook formals body) 
  (if (null? formals)
      body
      (list 'lambda (list (car formals)) (curry-cook (cdr formals) body))
      )  
  )

(define (curry-consume curry args)
 (if (null? args)
      curry
      (curry-consume (curry (car args)) (cdr args))
 ))

(define-macro (switch expr cases)
  (switch-to-cond (list 'switch expr cases)))

(define (switch-to-cond switch-expr)
  (cons 'cond
        (map
         (lambda (case) (cons (list 'equal? (car (cdr switch-expr)) (car case)) (cdr case)))
         (car (cdr (cdr switch-expr))))))

(define (min x y)
  (if (< x y)
      x
      y))

(define (count f n i)
  (if (= i 0)
      0
      (+ (if (f n i)
             1
             0)
         (count f n (- i 1)))))

(define (is-factor dividend divisor)
  (if (equal? (modulo dividend divisor) 0)
      #t
      #f))

(define (switch-factors n)
  (switch (min 3 (count is-factor n n)) ((1 (print 'one))
                                (2 (print 'prime))
                                (3 (print 'composite)) 
  
  )))
