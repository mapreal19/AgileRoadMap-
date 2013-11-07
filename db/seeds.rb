# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

# --- 42 Prácticas Ágiles ---

# Borramos para asegurar que no hayan contenidos duplicados
Practica.delete_all

Practica.create!({id: 40, position: 1, name: "Promover la sencillez en todos los aspectos. Ofrecer \
	la solución más simple y mínima que pueda ser satisfactoria para el cliente.", agile_method: "Lean, XP"})
Practica.create!({id: 1, position: 2, name: "Abordar y entregar trabajo terminado de forma incremental.", 
	agile_method: "Kanban, XP, Scrum"})
Practica.create!({id: 23, position: 3, name: "Realizar entregas frecuentes de unidades de trabajo terminadas",
	agile_method: "Kanban, XP, Scrum"})
Practica.create!({id: 25, position: 4, name: "Realizar reuniones de planificación frecuentemente (frecuencia \
	de pocas semanas, no meses).", agile_method: "XP, Scrum" })
Practica.create!({id: 34, position: 5, name: "Acotar el trabajo previsto para un período en base a su estimación \
	y la correspondiente coherencia con la capacidad del equipo", agile_method: "XP, Scrum" })
Practica.create!({id: 41, position: 6, name: "Organizar el trabajo en iteraciones que agrupan unidades de trabajo \
	que son entregadas en una fecha prevista.", agile_method: "XP, Scrum" })
Practica.create!({id: 50, position: 7, name: "Evitar invertir esfuerzo en adelantar trabajo que no esté comprometido \
	y/o no esté cercano a su entrega.", agile_method: "Lean" })
Practica.create!({id: 44, position: 8, name: "Organizar el trabajo del equipo con el foco en la generación de un buen \
	flujo de trabajo terminado.", agile_method: "Kanban" })
Practica.create!({id: 24, position: 9, name: "Gestión continua y multicriterio del trabajo pendiente para que esté \
	siempre debidamente priorizado.", agile_method: "Scrum" })
Practica.create!({id: 31, position: 10, name: "Limitar el trabajo en proceso (WIP), es decir, la cantidad de unidades \
	de trabajo que tiene el equipo en una determinada actividad.", agile_method: "Kanban" })
Practica.create!({id: 45, position: 11, name: "Formar equipos pequeños y procurar que mantengan sus integrantes.", 
	agile_method: "XP, Scrum" })
Practica.create!({id: 43, position: 12, name: "Acotar el ámbito de trabajo de cada equipo.", agile_method: "" })
Practica.create!({id: 3, position: 13, name: "Seguimiento continuo (frecuencia de días, no semanas).", 
	agile_method: "Kanban, XP, Scrum"})
Practica.create!({id: 28, position: 14, name: "Realizar una reunión diaria del equipo al completo, cara a cara y \
	muy breve.", agile_method: "XP, Scrum" })
Practica.create!({id: 8, position: 15, name: "Visualización de todo el trabajo pendiente encargado al equipo.", 
	agile_method: "" })
Practica.create!({id: 30, position: 16, name: "Gestión integrada de todo el trabajo asignado, tanto a nivel del equipo \
	como a nivel de cada miembro.", agile_method: "" })
Practica.create!({id: 9, position: 17, name: "Cliente en estrecho contacto con el equipo y altamente disponible, \
	incluso si es posible, que esté in-situ", agile_method: "XP, Scrum"})
Practica.create!({id: 18, position: 18, name: "Que exista una única persona que tome las decisiones respecto de las \
	prioridades del trabajo del equipo y que sea un buen representante de la parte cliente", agile_method: "XP, Scrum"})
Practica.create!({id: 26, position: 19, name: "Realizar reuniones de revisión del trabajo entregado", 
	agile_method: "Scrum"})
Practica.create!({id: 13, position: 20, name: "El equipo se auto-organiza y toma las decisiones técnicas", 
	agile_method: "Scrum"})
Practica.create!({id: 37, position: 21, name: "Jefe de carácter líder y facilitador en lugar de actitud del jefe \
	autoritario y controlador", agile_method: "XP, Scrum"})
Practica.create!({id: 5, position: 22, name: "Co-localización de los miembros del equipo, todo el equipo trabajando \
	en el mismo espacio físico.", agile_method: "XP, Scrum"})
Practica.create!({id: 49, position: 23, name: "Contar con un espacio físico de trabajo que favorezca la interacción \
	entre los miembros del equipo.", agile_method: "XP"})
Practica.create!({id: 47, position: 24, name: "Establecer y comunicar al equipo la visión del producto o servicio, \
	y reforzarla regularmente.", agile_method: "XP"})
Practica.create!({id: 6, position: 25, name: "Que el equipo sume entre sus miembros las habilidades para abordar \
	todas las actividades necesarias para terminar el trabajo.", agile_method: "Scrum"})
Practica.create!({id: 42, position: 26, name: "Que los integrantes del equipo puedan encargarse de diferentes tipos \
	de actividades (ojalá de todas), aunque puedan ser especialistas en alguna(s) de ellas.", agile_method: "Scrum"})
Practica.create!({id: 2, position: 27, name: "Trabajo centrado en satisfacer pruebas de aceptación acordadas \
	con el cliente.", agile_method: "XP"})
Practica.create!({id: 4, position: 28, name: "Documentar, pero solo lo estrictamente necesario. Que sea rentable \
	el aprovechamiento de la documentación respecto del esfuerzo asociado a elaborarla.", agile_method: "Lean"})
Practica.create!({id: 48, position: 29, name: "Establecer pautas para gestionar convenientemente el \
	re-trabajo.", agile_method: "Lean"})
Practica.create!({id: 14, position: 30, name: "Que exista un líder de mejora de proceso disponible \
	para el equipo.", agile_method: "XP, Scrum"})
Practica.create!({id: 17, position: 31, name: "Establecimiento de estándares para el trabajo técnico \
	del equipo", agile_method: "XP"})
Practica.create!({id: 27, position: 32, name: "Realizar reuniones de retrospectiva para evaluar el \
	desempeño del equipo y sus formas de trabajo. Mejora continua del proceso.", agile_method: "Scrum"})
Practica.create!({id: 33, position: 33, name: "Acordar y definir qué se entiende por trabajo terminado, \
	tanto para las actividades realizadas por el equipo como respecto de las entregas al cliente", 
	agile_method: "Scrum"})
Practica.create!({id: 12, position: 34, name: "Trabajo o actividades realizadas en conjunto por dos o más \
	integrantes", agile_method: "XP"})
Practica.create!({id: 32, position: 35, name: "No abusar de las horas extras, negociar y \
	re-planificar oportunamente para evitarlo", agile_method: "XP"})
Practica.create!({id: 35, position: 36, name: "Reducir las interrupciones o cambios de contexto que \
	afectan en su trabajo a los miembros del equipo", agile_method: "Lean"})
Practica.create!({id: 7, position: 37, name: "Establecer una disciplina de aprovechamiento de las reuniones", 
	agile_method: ""})
Practica.create!({id: 10, position: 38, name: "Automatizar las pruebas para poder garantizar que el producto \
	mantiene el comportamiento deseado cuando se realizan cambios", agile_method: "XP"})
Practica.create!({id: 39, position: 39, name: "Postergar hasta último momento la asignación del encargado de \
	realizar una actividad. ", agile_method: ""})
Practica.create!({id: 11, position: 40, name: "Integrar de forma continua en el producto el trabajo terminado", 
	agile_method: "XP"})
Practica.create!({id: 15, position: 41, name: "Promover que los miembros del equipo en su trabajo lleguen a conocer todas \
	las partes del producto o servicio que han sido encargadas al equipo.", agile_method: "XP"})
Practica.create!({id: 16, position: 42, name: "Mejorar continuamente la organización interna del producto para facilitar \
	su mantenimiento.", agile_method: "XP"})

# --- [END]42 Prácticas Ágiles ---
