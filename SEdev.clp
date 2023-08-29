;;; Sistema para recomendación de libros de magia
;;;


(defrule inicio
    =>
    (printout t "¡Bienvenido a la recomendación de libros de magia!" crlf)
    (printout t "¡Bienvenido a la recomendación de libros de magia!" crlf)
(printout t "Por favor responder 1 para un Sí y 0 para No" crlf crlf)

;;; Ingreso de hechos sobre preferencias

(printout t "¿Te interesa la magia con cartas?" crlf)
(bind ?cartas (read))
(assert (magia-cartas ?cartas)) 

(printout t "¿Te interesa la magia de escenario?" crlf)
(bind ?escenario (read))
(assert (magia-escenario ?escenario)) 

(printout t "¿Prefieres libros para principiantes?" crlf)
(bind ?principiantes (read))
(assert (libros-principiantes ?principiantes)) 

(printout t "¿Te gustaría aprender trucos de magia con objetos cotidianos?" crlf)
(bind ?objetos (read))
(assert (magia-objetos ?objetos)) 

(printout t "¿Te atrae la magia mentalista?" crlf)
(bind ?mentalismo (read))
(assert (magia-mentalismo ?mentalismo))

(printout t "¿Te gustaría conocer la historia de la magia?" crlf)
(bind ?historia (read))
(assert (historia-magia ?historia)) 

(printout t "¿Te interesa aprender sobre magia de cerca?" crlf)
(bind ?cerca (read))
(assert (magia-cerca ?cerca))

(printout t "¿Te gustaría aprender sobre magia de escapismo?" crlf)
(bind ?escapismo (read))
(assert (magia-escapismo ?escapismo))

(printout t "¿Te gustaría aprender magia con monedas?" crlf)
(bind ?monedas (read))
(assert (magia-monedas ?monedas))

(printout t "¿Te interesa la magia de mentalismo psicológico?" crlf)
(bind ?mentalismo-psicologico (read))
(assert (magia-mentalismo-psicologico ?mentalismo-psicologico))

(printout t "¿Te gustaría aprender trucos con cuerdas y pañuelos?" crlf)
(bind ?cuerdas-panuelos (read))
(assert (magia-cuerdas-panuelos ?cuerdas-panuelos))

(printout t "¿Te gustaría aprender trucos de magia con líquidos?" crlf)
(bind ?liquidos (read))
(assert (magia-liquidos ?liquidos))

(printout t "¿Te interesa la magia de mentalismo con cartas?" crlf)
(bind ?mentalismo-cartas (read))
(assert (magia-mentalismo-cartas ?mentalismo-cartas))

(printout t "¿Te gustaría aprender sobre magia con objetos de la naturaleza?" crlf)
(bind ?naturaleza (read))
(assert (magia-naturaleza ?naturaleza))

(printout t "¿Te interesa la magia de escapismo acuático?" crlf)
(bind ?escapismo-acuatico (read))
(assert (magia-escapismo-acuatico))

(printout t "¿Te gustaría aprender trucos de magia con fuego?" crlf)
(bind ?fuego (read))
(assert (magia-fuego ?fuego))

)

;;; Definir funciones para el cálculo

(deffunction PuntuacionTotal
    (?cartas ?escenario ?principiantes ?objetos ?mentalismo ?historia ?cerca
     ?escapismo ?monedas ?mentalismo-psicologico ?cuerdas-panuelos ?liquidos ?mentalismo-cartas)
    (+ ?cartas ?escenario ?principiantes ?objetos ?mentalismo ?historia ?cerca
       ?escapismo ?monedas ?mentalismo-psicologico ?cuerdas-panuelos ?liquidos ?mentalismo-cartas))

;;; Definir las reglas para las respuesta 

(defrule muestra-recomendacion
    (puntuacion ?p)
    =>
    (printout t "Basado en tus preferencias, te recomendamos los siguientes libros de magia:" crlf)
    (if (>= ?p 15) then
        (printout t "- 'El Gran Libro de la Magia' por Houdini" crlf)
        (printout t "- 'La Enciclopedia de la Magia' por Mark Wilson" crlf))
    (if (>= ?p 12) then
        (printout t "- 'Cartomagia Fundamental' por Vicente Canuto" crlf)
        (printout t "- 'Secretos de la Magia de Escenario' por Goldin" crlf))
    (if (>= ?p 10) then
        (printout t "- 'Magia con Objetos Cotidianos' por Harlan Tarbell" crlf))
    (if (>= ?p 8) then
        (printout t "- 'Mentalismo Moderno' por Luke Jermay" crlf)
        (printout t "- 'El Arte del Engaño: Manual de Ilusionismo' por Nicholas Caputo" crlf))
    (if (>= ?p 6) then
        (printout t "- 'Monedas y Monedas' por Amilkar Riega" crlf)
        (printout t "- '101 Trucos Mágicos' por Harry Lorayne" crlf))
    (if (>= ?p 5) then
        (printout t "- 'Magia Fácil para Principiantes' por Joseph Leeming" crlf))
    (if (>= ?p 4) then
        (printout t "- 'Magia para Dummies' por David Pogue" crlf))
    (if (>= ?p 3) then
        (printout t "- 'Pequeños Trucos de Magia' por Mago Migue" crlf))
    (if (>= ?p 2) then
        (printout t "- 'Curso de Magia Tarbell' por Harlan Tarbell" crlf))
    (if (>= ?p 1) then
        (printout t "- 'Magia Básica' por Adolfo Masyebra" crlf)
        (printout t "- 'El Mundo Mágico de Juan Tamariz' por Juan Tamariz" crlf))
)

(defrule calcular-puntuacion
    (magia-cartas ?cartas)
    (magia-escenario ?escenario)
    (libros-principiantes ?principiantes)
    (magia-objetos ?objetos)
    (magia-mentalismo ?mentalismo)
    (historia-magia ?historia)
    (magia-cerca ?cerca)
    (magia-escapismo ?escapismo)
    (magia-monedas ?monedas)
    (magia-mentalismo-psicologico ?mentalismo-psicologico)
    (magia-cuerdas-panuelos ?cuerdas-panuelos)
    (magia-liquidos ?liquidos)
    (magia-mentalismo-cartas ?mentalismo-cartas)
    =>
    (bind ?puntuacion (PuntuacionTotal ?cartas ?escenario ?principiantes ?objetos ?mentalismo ?historia ?cerca
                                    ?escapismo ?monedas ?mentalismo-psicologico ?cuerdas-panuelos ?liquidos ?mentalismo-cartas))
    (assert (puntuacion ?puntuacion))
)
