;;Constraits / Restricciones

(deffunction intersect (?set ?sett)
    (bind ?r (create$))
    (foreach ?e ?set
        (if (and (eq ?e ?sett) (member$ ?e ?r))
        then (bind ?r (create$ ?r ?e)))
    )
    (return (length$ ?r))
)
;;; candidata a ser borrada

;No se repiten elementos

(defrule menos_combinaciones
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion $?inicio ?ele $?medio ?ele $?)
    ?f <- (elementos (elemento ?ele))
    =>
    (modify ?f (eliminado 1))
    (assert (vuelta-atras))
)

;Los dos nulos no pueden aparecer juntos

(defrule filtro_nulos_separados
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion $? ?a  ?b $?)
    (libro (key ?a)(categoria ?cat1))
    (libro (key ?b)(categoria ?cat1))
    (test (eq ?cat1 nulo)) 
    ?f <- (elementos (elemento ?b))
   =>
    (modify ?f (eliminado 1))
    (assert (vuelta-atras))
)

; Junta dos libros de la misma categoria en el mismo estante
(defrule categorias
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion  $?inicio ?a ?b $?final)
    (test (= (mod (length$ ?inicio) 3) 0))
    ?f <- (elementos (elemento ?a))
    (libro (key ?a)(categoria ?cat1))
    (libro (key ?b)(categoria ?cat2))
    (or (test(neq ?cat1 ?cat2)) (test(eq ?cat2 nulo)))
    =>
    (modify ?f (eliminado 1))
    (assert (vuelta-atras))
)

;Elimina aquellas combinaciones que tienen dos libros de la misma categoria juntos y uno separado despues
(defrule categorias_compact_forward
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion  $? ?a $?medio ?b $?intermedio ?c $?)
    (test (>  (length$ ?intermedio)  0))
    (test (>  (length$ ?medio)  -1))
    (libro (key ?a)(categoria ?cat1))
    (libro (key ?b)(categoria ?cat1))
    (libro (key ?c)(categoria ?cat1))
    ?f <- (elementos (elemento ?a))
    =>
    (modify ?f (eliminado 1))
    (assert (vuelta-atras))

)

;Elimina aquellas combinaciones que tienen dos libros de la misma categoria juntos y uno separado antes
(defrule categorias_compact_backwards
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion  $? ?a $?medio ?b $?intermedio ?c $?)
    (test (>  (length$ ?intermedio)  -1))
    (test (>  (length$ ?medio)  0))
    (libro (key ?a)(categoria ?cat1))
    (libro (key ?b)(categoria ?cat1))
    (libro (key ?c)(categoria ?cat1))
    ?f <- (elementos (elemento ?a))
    =>
    (modify ?f (eliminado 1))
    (assert (vuelta-atras))

)
;Elimina aquellas combinaciones con varias categorias en una estanteria
(defrule categorias_misma_estanteria
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion  $?inicio ?a ?b ?c $?final)
    (test (= (mod (length$ ?inicio) 3) 0))
    ?f <- (elementos (elemento ?a))
    (libro (key ?a)(categoria ?cat1))
    (libro (key ?b)(categoria ?cat2))
	(libro (key ?c)(categoria ?cat3))
    (and (test(eq ?cat1 ?cat2)) (test(eq ?cat1 Novela)))
	(test(neq ?cat3 Novela))
    =>
    (modify ?f (eliminado 1))
    (assert (vuelta-atras))
)
;Elimina solucion donde los libros de novela no estan ordenados por fechas 
(defrule ordenados_por_fecha_libros_novela
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion  $?inicio ?a ?b ?c $?final)
    (test (= (mod (length$ ?inicio) 3) 0))
    ?f <- (elementos (elemento ?a))
    (libro (key ?a)(anno ?f1)(categoria ?cat1))
    (libro (key ?b)(anno ?f2)(categoria ?cat1))
	(libro (key ?c)(anno ?f3)(categoria ?cat1))
	(or (test(> ?f1 ?f2)) (test(> ?f2 ?f3)))
    =>
    (modify ?f (eliminado 1))
    (assert (vuelta-atras))
)
;Elimina solucion donde los libros de las otras categorias que no estan ordenados por fechas 
(defrule ordenados_por_fecha_libros_distintos_novela
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion  $?inicio ?a ?b $?final)
    (test (= (mod (length$ ?inicio) 3) 0))
    ?f <- (elementos (elemento ?a))
    (libro (key ?a)(anno ?f1)(categoria ?cat1))
    (libro (key ?b)(anno ?f2))
	(and (test(> ?f1 ?f2)) (test(neq ?cat1 Novela)))
    =>
    (modify ?f (eliminado 1))
    (assert (vuelta-atras))
)

	
	





