;;;;
;;;; hechos
;;;;

(deffacts datos
; numero de variables del problema
  (estructura 7)	

  ; dominios para cada variable
  (dominio 1 a b c d e f g) 
  (dominio 2 a b c d e f g) 
  (dominio 3 a b c d e f g)
  (dominio 4 a b c d e f g)
  (dominio 5 a b c d e f g)
  (dominio 6 a b c d e f g)
  (dominio 7 a b c d e f g)
  
;solucion
	(solucion))

;(deffacts informacion-control
;	(secuencia-fases avances restricciones))

; contador de soluciones encontradas
(defglobal ?*nsol* = 0) 

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