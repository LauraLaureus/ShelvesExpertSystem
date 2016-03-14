;;Constraits / Restricciones

(deffunction intersect (?set ?sett)
    (bind ?r (create$))
    (foreach ?e ?set
        (if (and (eq ?e ?sett) (member$ ?e ?r))
        then (bind ?r (create$ ?r ?e)))
    )
    (return (length$ ?r))
)


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



