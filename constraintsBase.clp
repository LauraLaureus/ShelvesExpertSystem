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




;;coger las tres primeras valores de la solucion, comprobar si tienen la misma categoia o la categoria nula. Eliminar los que no cumplan la restriccion.

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

(defrule nulos_al_final
    (declare (salience 200))
    (fase avance)
    (not (vuelta-atras))
    (solucion $?c ?a  $?)
    
)

;(defrule categorias
;    (declare (salience 200))
;    (fase avance)
;    (not (vuelta-atras))
;    (solucion $?h ?a ?b $?)
;    (test (neq (mod (+ (length$ ?h) 1) 3) 0))
;    (libro (key ?a)(categoria ?cat1))
;    (libro (key ?b)(categoria ?cat2))
;    (test (neq ?cat1 ?cat2))
    ;(or
;        (test (eq ?cat1 nulo))
;        (test (eq ?cat2 nulo))
    ;)
;     ?f <- (elementos (elemento ?b))
;    =>
;    (modify ?f (eliminado 1))
;    (assert (vuelta-atras))
;)


