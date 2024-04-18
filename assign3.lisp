;; Return T if item is a member of set.

;; Return NIL if item is not a member of set.

;; The type of set is list.

;; Examples:

;;  (set-member '(1 2) 1) => T

;;  (set-member '(1 2) 3) =>  NIL

(defun set-member (set item)
  (cond
    ((= (length set) 0) nil)           ;; base case - empty set
    ((equal (car set) item) T)         ;; check first element of list
    (T (set-member (cdr set) item)))   ;; recursively check rest of list
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the union of set-1 and set-2.

;; The result should contain no duplicates.

;; Assume set-1 contains no duplicates and set-2 contains no duplicates.

;; Examples:

;;   (set-union '(1 2) '(2 4)) => '(1 2 4)

(defun set-union (set-1 set-2)

  ;;Your implementation go here

  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the intersection of set-1 and set-2.

;; The result should contain no duplicates.

;; Assume set-1 contains no duplicates and set-2 contains no duplicates.

;; Examples:

;;   (set-intersection '(1 2) '(2 4)) => '(2)

(defun set-intersection (set-1 set-2)

  ;;Your implementation go here

  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the difference of set-1 and set-2.

;; The result should contain no duplicates.

;; Assume set-1 contains no duplicates and set-2 contains no duplicates.

;;

;; Examples:

;;   (set-diff '(1 2) '(2 4)) => '(1)

(defun set-diff (set-1 set-2)

  ;;Your implementation go here

  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the exclusive or of a and b

;;

;; Examples:

;;  (boolean-xor t nil) => t

;;  (boolean-xor nil nil) => nil

(defun boolean-xor (a b)
  (if  (equal a b)
       NIL
       T)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the implication of a and b

;;

;; Examples:

;;  (boolean-implies t nil) => nil

;;  (boolean-implies nil nil) => t

(defun boolean-implies (a b)
  (cond
    ((not a) T)   ;; if a = NIL, return T
    (b T)         ;; if a = T and B = T, return T
    (T NIL))      ;; if a = T and B = NIL, return NIL
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the bi-implication (if and only if) of a and b

;;

;; Examples:

;;  (boolean-iff t nil) => nil

;;  (boolean-iff nil nil) => t

(defun boolean-iff (a b)
  (if (equal a b)
      T
      NIL)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evaluate a boolean expression.

;; Handle NOT, AND, OR, XOR, IMPLIES, and IFF.

;;

;; Examples:

;;  (boolean-eval '(and t nil)) => nil

;;  (boolean-eval '(and t (or nil t)) => t

(defun boolean-eval (exp)
  (cond
    ;; base case: make expression is a boolean
    ((or (equal exp T) (equal exp NIL)) exp)

    ;; not case
    ((equal (car exp) 'not)
	    (if (or (equal (second exp) T) (equal (second exp) NIL))
		(not (second exp))
		(not (boolean-eval (cadr exp)))))

    ;; and case
    ((equal (car exp) 'and)
	    (if (or (equal (third exp) T) (equal (third exp) NIL))
		(and (second exp) (third exp))
		(and (boolean-eval (cadr exp)))))

    ;;or case
    ((equal (car exp) 'or)
	    (if (or (equal (third exp) T) (equal (third exp) NIL))
		(or (second exp) (third exp))
		(or (boolean-eval (cadr exp)))))

    ;;xor case
    ((equal (car exp) 'xor)
	    (if (or (equal (third exp) T) (equal (third exp) NIL))
		(funcall #'boolean-xor (second exp) (third exp))
		(boolean-eval (cadr exp))))

    ;;iff case
    ((equal (car exp) 'iff)
	    (if (or (equal (third exp) T) (equal (third exp) NIL))
		(funcall #'boolean-iff (second exp) (third exp))
		(boolean-eval (cadr exp))))    

    ;;implies case
    ((equal (car exp) 'implies)
	    (if (or (equal (third exp) T) (equal (third exp) NIL))
		(funcall #'boolean-implies (second exp) (third exp))
		(boolean-eval (cadr exp))))    
    
  )   
)

(defun test-case ()
  ;;(format t "~%========= test set-member =========~%")
  ;;(format t "set-member Test case 1 (T): ~x~%" (set-member '(1 2) 1))
  ;;(format t "set-member Test case 2 (NIL): ~x~%" (set-member '(1 2) 3))
  
  ;;(format t "~%========= test set-union =========~%")
  ;;(format t "set-union Test case {1 2 4}: ~x~%" (set-union '(1 2) '(2 4)))
  
  ;;(format t "~%========= test set-intersection =========~%")
  ;;(format t "set-intersection Test case {2}: ~x~%" (set-intersection '(1 2) '(2 4)))
  
  ;;(format t "~%========= test set-diff =========~%")
  ;;(format t "set-diff Test case {1}: ~x~%" (set-diff '(1 2) '(2 4)))
  
  ;;(format t "~%========= test XOR =========~%")
  ;;(format t "XOR Test 1 (T): ~x~%" (boolean-xor T NIL))
  ;;(format t "XOR Test 2 (T): ~x~%" (boolean-xor NIL T))
  ;;(format t "XOR Test 3 (NIL): ~x~%" (boolean-xor T T))
  ;;(format t "XOR Test 4 (NIL): ~x~%" (boolean-xor NIL NIL))
  
  ;;(format t "~%========= test IFF =========~%")
  ;;(format t "IFF Test 1 (T): ~x~%" (boolean-iff T T))
  ;;(format t "IFF Test 2 (T): ~x~%" (boolean-iff NIL NIL))
  ;;(format t "IFF Test 3 (NIL): ~x~%" (boolean-iff T NIL))
  ;;(format t "IFF Test 4 (NIL): ~x~%" (boolean-iff NIL T))
  
  ;;(format t "~%========= test IMPLIES  =========~%")
  ;;(format t "IMPLIES Test 1 (T): ~x~%" (boolean-implies NIL NIL))
  ;;(format t "IMPLIES Test 2 (T): ~x~%" (boolean-implies NIL T))
  ;;(format t "IMPLIES Test 3 (T): ~x~%" (boolean-implies T T))
  ;;(format t "IMPLIES Test 4 (NIL): ~x~%" (boolean-implies T NIL))

  ;;(format t "~%========= test BOOL-EVAL =========~%")
  ;;(format t "EVAL NOT BOOLEAN EXP (NIL): ~x~%" (boolean-eval '(none)))

  ;;(format t "NOT Test 1 (T): ~x~%" (boolean-eval '(not NIL)))
  ;;(format t "NOT Test 2 (NIL): ~x~%" (boolean-eval '(not T)))
  ;;(format t "NESTED NOT Test 1 (T): ~x~%" (boolean-eval '(not (not T))))
  ;;(format t "NESTED NOT Test 2 (NIL): ~x~%" (boolean-eval '(not (not NIL))))

  ;;(format t "AND Test 1 (T): ~x~%" (boolean-eval '(and T T)))
  ;;(format t "AND Test 2 (NIL): ~x~%" (boolean-eval '(and NIL NIL)))
  ;;(format t "AND Test 3 (NIL): ~x~%" (boolean-eval '(and T NIL)))
  ;;(format t "AND Test 4 (NIL): ~x~%" (boolean-eval '(and NIL T)))
  ;;(format t "NESTED AND Test 1 (T): ~x~%" (boolean-eval '(and (and T T) (and NIL NIL))))
  ;;(format t "NESTED AND Test 2 (NIL): ~x~%" (boolean-eval '(and (and NIL T) (and NIL NIL))))
  
  ;;(format t "OR Test 1 (T): ~x~%" (boolean-eval '(or T NIL)))
  ;;(format t "OR Test 2 (T): ~x~%" (boolean-eval '(or NIL T)))
  ;;(format t "OR Test 3 (T): ~x~%" (boolean-eval '(or T T)))
  ;;(format t "OR Test 4 (NIL): ~x~%" (boolean-eval '(or NIL NIL)))
  ;;(format t "NESTED OR Test 1(T): ~x~%" (boolean-eval '(or (or T NIL) (or T T))))
  ;;(format t "NESTED OR Test 2(NIL): ~x~%" (boolean-eval '(or (or NIL NIL) (or NIL NIL))))
  
  ;;(format t "XOR Test 1 (T): ~x~%" (boolean-eval '(xor T NIL)))
  ;;(format t "XOR Test 2 (T): ~x~%" (boolean-eval '(xor NIL T)))
  ;;(format t "XOR Test 3 (NIL): ~x~%" (boolean-eval '(xor T T)))
  ;;(format t "XOR Test 4 (NIL): ~x~%" (boolean-eval '(xor NIL NIL)))
  ;;(format t "NESTED XOR Test 1 (T) ~x~%" (boolean-eval '(xor (xor T NIL) (xor T T))))
  ;;(format t "NESTED XOR Test 2 (NIL) ~x~%" (boolean-eval '(xor (xor NIL NIL) (xor T T))))

  ;;(format t "IFF Test 1 (T): ~x~%" (boolean-eval '(iff T T)))
  ;;(format t "IFF Test 2 (T): ~x~%" (boolean-eval '(iff NIL NIL)))
  ;;(format t "IFF Test 3 (NIL): ~x~%" (boolean-eval '(iff T NIL)))
  ;;(format t "IFF Test 4 (NIL): ~x~%" (boolean-eval '(iff NIL T)))
  ;;(format t "NESTED IFF Test 1 (T): ~x~%" (boolean-eval '(iff (iff T T) (iff NIL NIL))))
  ;;(format t "NESTED IFF Test 2 (NIL): ~x~%" (boolean-eval '(iff (iff T T) (iff NIL T))))

  ;;(format t "IMPLIES Test 1 (T): ~x~%" (boolean-eval '(implies NIL NIL)))
  ;;(format t "IMPLIES Test 2 (T): ~x~%" (boolean-eval '(implies NIL T)))
  ;;(format t "IMPLIES Test 3 (T): ~x~%" (boolean-eval '(implies T T)))
  ;;(format t "IMPLIES Test 4 (NIL): ~x~%" (boolean-eval '(implies T NIL)))
  ;;(format t "NESTED IMPLIES Test 1 (T): ~x~%" (boolean-eval '(implies (implies NIL NIL) (implies T T))))
  ;;(format t "NESTED IMPLIES Test 2 (NIL): ~x~%" (boolean-eval '(implies (implies NIL NIL) (implies T NIL))))
 
  ;;(format t "EVAL COMBO Test 1 (T): ~x~%" (boolean-eval '(and t (or nil t))))
  ;;(format t "EVAL COMBO Test 2 (NIL): ~x~%" (boolean-eval '(and t nil)))
  ;;(format t "EVAL COMBO Test 3 (T): ~x~%" (boolean-eval '(not (and t nil))))
  )
