# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# --- 42 Prácticas Ágiles ---

# Borramos para asegurar que no hayan contenidos duplicados
Practica.delete_all

Practica.create!({id: 40, position: 1, name: 'Promover la sencillez en todos los aspectos. Ofrecer \
	la solución más simple y mínima que pueda ser satisfactoria para el cliente.', agile_method: 'Lean, XP'})
Practica.create!({id: 1, position: 2, name: 'Abordar y entregar trabajo terminado de forma incremental.', 
	agile_method: 'Kanban, XP, Scrum'})
Practica.create!({id: 23, position: 3, name: 'Realizar entregas frecuentes de unidades de trabajo terminadas',
	agile_method: 'Kanban, XP, Scrum'})
Practica.create!({id: 25, position: 4, name: 'Realizar reuniones de planificación frecuentemente (frecuencia \
	de pocas semanas, no meses).', agile_method: 'XP, Scrum' })
Practica.create!({id: 34, position: 5, name: 'Acotar el trabajo previsto para un período en base a su estimación \
	y la correspondiente coherencia con la capacidad del equipo', agile_method: 'XP, Scrum' })
Practica.create!({id: 41, position: 6, name: '', agile_method: 'XP, Scrum' })
Practica.create!({id: 50, position: 7, name: '', agile_method: 'Lean' })
Practica.create!({id: 44, position: 8, name: '', agile_method: 'Kanban' })
Practica.create!({id: 24, position: 9, name: '', agile_method: 'Scrum' })
Practica.create!({id: 31, position: 10, name: '', agile_method: 'Kanban' })
Practica.create!({id: 45, position: 11, name: '', agile_method: 'XP, Scrum' })
Practica.create!({id: 43, position: 12, name: '', agile_method: '' })
Practica.create!({id: 3, position: 13, name: '', agile_method: 'Kanban, XP, Scrum'})
Practica.create!({id: 28, position: 14, name: '', agile_method: 'XP, Scrum' })
Practica.create!({id: 8, position: 15, name: '', agile_method: '' })
Practica.create!({id: 30, position: 16, name: '', agile_method: '' })
Practica.create!({id: 9, position: 17, name: '', agile_method: 'XP, Scrum'})
#TODO