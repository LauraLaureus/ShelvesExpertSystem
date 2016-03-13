;;;;
;;;; hechos
;;;;

(deftemplate elementos
	(slot posicion
		(default 0)
		(type INTEGER))
	(slot elemento
		(default ?DERIVE)
		(type SYMBOL))
	(slot eliminado
		(default 0)
		(type INTEGER)))

(deffacts datos
; numero de variables del problema ->9 3 estaterias de 3 libros 
  (estructura 9)	

  ; dominios para cada variable
  (dominio 1 a b c d e f g) 
  (dominio 2 a b c d e f g) 
  (dominio 3 a b c d e f g)
  (dominio 4 a b c d e f g)
  (dominio 5 a b c d e f g)
  (dominio 6 a b c d e f g)
  (dominio 7 a b c d e f g)
  (dominio 8 a b c d e f g)
  (dominio 9 a b c d e f g)
  
;solucion
	(solucion))

;
(deftemplate libro
    (slot nombre)
    (slot anno)
    (slot categoria)
    (slot key (allowed-values a b c d e f g))
)


(deffacts matching_table
 
    (libro
        (nombre CienAnnosSoledad)
        (anno 1967)
        (categoria Novela)
        (key a)
    )
    
    
    (libro
        (nombre LosPilaresDeLaTierra)
        (anno 1989)
        (categoria Novela)
        (key b)
    )
    
    
    
    (libro
        (nombre YoRobot)
        (anno 1950)
        (categoria Novela)
        (key c)
    )
    
    
    (libro
        (nombre LaMalea)
        (anno 1982)
        (categoria Poesia)
        (key d)
    )
    
    (libro
        (nombre LaOrillaDelSar)
        (anno 1884)
        (categoria Poesia)
        (key e)
    )
    
    
    (libro
        (nombre ExpertSystems)
        (anno 2004)
        (categoria Manual)
        (key f)
    )
    
    
    (libro
        (nombre TecnologiasWebSemantica)
        (anno 2011)
        (categoria Manual)
        (key g)
    )

)

;(deffacts informacion-control
;	(secuencia-fases avances restricciones))

; contador de soluciones encontradas
(defglobal ?*nsol* = 0) 

