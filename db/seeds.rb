# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
require 'open-uri'
# http://stackoverflow.com/questions/130948/ruby-convert-file-to-string

# --- Ámbito de trabajo ---
AmbitoTrabajo.delete_all
AmbitoTrabajo.create!({id: 1, nombre: 'Desarrollo y/o mantenimiento de productos'})
AmbitoTrabajo.create!({id: 2, nombre: 'Atención y soporte al cliente'})
AmbitoTrabajo.create!({id: 3, nombre: 'Resolución de incidencias'})
AmbitoTrabajo.create!({id: 4, nombre: 'Tramitación de documentos'})
AmbitoTrabajo.create!({id: 5, nombre: 'Otro'})

# --- Sector empresa ---
SectorEmpresa.delete_all
SectorEmpresa.create!({id: 1, nombre: 'Tecnología y Software'})
SectorEmpresa.create!({id: 2, nombre: 'Telecomunicaciones'})
SectorEmpresa.create!({id: 3, nombre: 'Auditoría y Consultoría'})
SectorEmpresa.create!({id: 4, nombre: 'Servicios'})
SectorEmpresa.create!({id: 5, nombre: 'Industria'})
SectorEmpresa.create!({id: 6, nombre: 'Construcción e Inmobilaria'})
SectorEmpresa.create!({id: 7, nombre: 'Banca y Seguros'})
SectorEmpresa.create!({id: 8, nombre: 'Otros'})



# --- Objetivos específicos de mejoras ---

Objetivo.delete_all
Objetivo.create!({id: 11, name: 'Alineación del trabajo del equipo con los objetivos del negocio', 
	sat_client: true, equipo: false, productivity: false})
Objetivo.create!({id: 1, name: 'Evitar o reducir los retrasos en las entregas', 
	sat_client: true, equipo: false, productivity: false})
Objetivo.create!({id: 5, name: 'Reducir defectos en el trabajo entregado al cliente', 
	sat_client: true, equipo: false, productivity: false})
Objetivo.create!({id: 21, name: 'Reducir el tiempo de entrega al cliente, acelerar el "time to market"', 
	sat_client: true, equipo: false, productivity: false})
Objetivo.create!({id: 12, name: 'Involucar en mayor medida al cliente en la planificación, definición y validación del trabajo', 
	sat_client: true, equipo: false, productivity: false})
Objetivo.create!({id: 8, name: 'Tomar decisiones en el momento oportuno', 
	sat_client: true, equipo: false, productivity: false})
Objetivo.create!({id: 10, name: 'Mejorar la comunicación dentro del equipo y con el cliente', 
	sat_client: true, equipo: true, productivity: false})
Objetivo.create!({id: 7, name: 'Hacer más visible el trabajo del equipo', 
	sat_client: false, equipo: true, productivity: false})
Objetivo.create!({id: 4, name: 'Reducir las horas extras o demanda no prevista de recursos humanos adicionales', 
	sat_client: false, equipo: true, productivity: false})
Objetivo.create!({id: 22, name: 'Gestionar eficazmente el contexto multi-proyecto', 
	sat_client: true, equipo: true, productivity: true})
Objetivo.create!({id: 14, name: 'Evitar costos asociados a la realización de tareas prescindibles o dudosamente rentables', 
	sat_client: false, equipo: true, productivity: true})
Objetivo.create!({id: 20, name: 'Reducir el re-trabajo debido a trabajo defectuoso o incompleto detectado por el equipo', 
	sat_client: false, equipo: true, productivity: true})
Objetivo.create!({id: 3, name: 'Gestionar eficazmente los cambios, tanto en los trabajos como en sus prioridades', 
	sat_client: false, equipo: true, productivity: true})
Objetivo.create!({id: 19, name: 'Promover la mejora continua del proceso empleado por el equipo', 
	sat_client: false, equipo: true, productivity: true})
Objetivo.create!({id: 9, name: 'Mejorar la gestión de recursos humanos en el equipo', 
	sat_client: false, equipo: true, productivity: true})
Objetivo.create!({id: 15, name: 'Mejorar la sistematización del trabajo', 
	sat_client: false, equipo: true, productivity: true})

# --- 42 Prácticas Ágiles ---

# Obtiene la descripción de la práctica a partir del fichero proporcionado
def get_content_from_file(filename)
  open("#{Rails.root}/db/pracs_desc/#{filename}", "rb:UTF-8").read
end

# Borramos para asegurar que no hayan contenidos duplicados
Practica.delete_all
#seed_file = File.join(Rails.root, 'db', 'seed.yml')
#config = YAML::load_file(seed_file)
#Practica.create!(config["practicas"])
#file = File.open("db/p1.txt", "rb")
#contents = file.read
Practica.create!({id: 40, position: 1, name: "Promover la sencillez en todos los aspectos. Ofrecer \
	la solución más simple y mínima que pueda ser satisfactoria para el cliente.",
  description: '<p>Ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: el cliente y el equipo se esmeran en conseguir una primera versión del producto demasiado ambiciosa en cuanto a las características que incluye y/o en cuanto al nivel de complejidad o sofisticación en el que se ofrecerán algunas de dichas características. </p><p>Hasta que el producto no se comience a utilizar no se tendrá una apreciación precisa del nivel de uso de las características del producto y de la utilidad que ellas ofrecen. Para evitar desperdicio de esfuerzo en desarrollo de características poco utilizadas o subutilizadas respecto de toda su funcionalidad implementada es preferible limitarse (al menos durante la generación de un producto) a trabajar con el diseño más sencillo que resuelve la necesidad del cliente y con el mínimo conjunto de características que pueden constituir un producto útil para el cliente. Esta práctica es mencionada como "Diseño simple" en Extreme Programming. Un término muy en sintonía con esta práctica es el de Minimun Viable Product (MVP), u otro también similar llamado Minimum Markeable Features (MMF), los cuales se refiere al conjunto más pequeño posible de características del producto o servicio que por sí mismas podrían aportar valor, constituyendo por ejemplo, una primera entrega de un producto o una primera versión de una nueva funcionalidad de cierta envergadura.  En una estrategia similar encontramos el Principio KISS ("Keep it simple, stupid") o el acrónimo YAGNI ("You aren\'t gonna need it"), el primero insiste en no sofisticar las soluciones y el otro en contener la ambición de añadir en el momento actual elementos no imprescindibles, y que incluso en el futuro podrían no ser necesarios. Otro aspecto interesante y relacionado con esta práctica se menciona entre los 7 Mudas (fuentes de desperdicio) de Lean Manufacturing, enunciado como: "Sobre-proceso: Trabajo o servicio adicional no percibido por el cliente", es decir, un esfuerzo invertido que no llega a ser valorado por el cliente. Lectura recomendada:   <a href=" http://agilismoatwork.blogspot.com.es/2013/12/bueno-bonito-y-barato-puede-conseguirse.html" target="_blank"> "Bueno, bonito y barato", ¿puede conseguirse esto con un método ágil? </a></p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 2, ambito_decision: 'equipo', agile_method: "Lean, XP"})
Practica.create!({id: 1, position: 2, name: "Abordar y entregar trabajo terminado de forma incremental.", 
	description:'<p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: abordar el desarrollo de un producto como un todo, concentrando todo análisis en un período, luego su diseño, implementación, etc., y haciendo una sola entrega al final. Esto corresponde a un enfoque de proceso secuencial o en cascada (si hay algo de solape entre las actividades).</p><p>No trabajar de forma incremental entraña un alto riesgo, especialmente si el alcance es grande, es decir, cuando solo después de realizar una gran inversión de tiempo o recursos se producirá la entrega que el cliente podrá explotar. Dicho riesgo se asocia a que lo definido inicialmente o con demasiada anticipación cambie antes de la entrega y obligue a hacer re-trabajo para alinear el resultados a los cambios. Un enfoque incremental requiere una definición preliminar de cada unidad de trabajo, pero solo el suficiente para su priorización, dejando la definición completa para el momento justo antes de realizar el trabajo.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'equipo', agile_method: "Kanban, XP, Scrum"})
Practica.create!({id: 23, position: 3, name: "Realizar entregas frecuentes de unidades de trabajo terminadas",
  description:  get_content_from_file('prac3.html'),
	effort: 5, ambito_decision: 'equipo', agile_method: "Kanban, XP, Scrum"})
Practica.create!({id: 25, position: 4, name: "Realizar reuniones de planificación frecuentemente (frecuencia \
	de pocas semanas, no meses).",
  description: '<p>En un contexto ágil se asume que la planificación puede cambiar para adecuarse a los cambios que se presenten, con lo cual el plan aunque conlleva compromisos de fechas y recursos, debería permitir cambios en cuando a alcance, para adaptarse a cambios de prioridades y cambios en la definición del trabajo. </p><p>Un ejemplo de una situación con la <string>anti-práctica</strong> es el siguiente: planificar intensamente al comienzo del proyecto y para un horizonte a mediano o largo plazo. En proyectos con muchos cambios durante su realización conviene planificar a corto plazo en detalle y a largo plazo hacerlo de forma global lo suficiente para gestionar el alcance. Lectura recomendada: <a href="http://agilismoatwork.blogspot.com.es/2012/12/gestion-del-alcance-en-un-proyecto-agil.html" target="_blank">Gestión ágil del alcance en un proyecto ágil</a>.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 2, ambito_decision: 'producto/servicio', agile_method: "XP, Scrum" })
Practica.create!({id: 34, position: 5, name: "Acotar el trabajo previsto para un período en base a su estimación \
	y la correspondiente coherencia con la capacidad del equipo",
  description: '<p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: comprometer un conjunto de trabajo que a priori ya se sabe que no será posible terminarlo en el plazo establecido. </p><p>Si el equipo no tiene una noción fiable de su capacidad (cantidad de trabajo que puede ser abordado con éxito en un período), cada vez que tenga que hacer una previsión o compromiso de trabajo correrá el riesgo de tener diferencias significativas con los datos reales del trabajo una vez efectuado. Es importante destacar que dependiendo del contexto la estimación del trabajo puede ser realizada con menor intensidad o solo de forma parcial, incluso puede prescindirse de ella. Además, la estimación de un trabajo no es una actividad aislada, siempre estará asociada a la definición del trabajo (definición que siempre debe hacerse en alguna medida), con lo cual estimar no debería representar un esfuerzo adicional significativo. La estimación podría considerarse obligatoria solo si la relación con el cliente involucra un contrato o acuerdo rígido respecto del alcance, plazos y recursos. Lectura recomendada: Estimación Ágil, <a href="http://agilismoatwork.blogspot.com.es/2011/12/estimacion-en-un-proyecto-agil.html" target="_blank">parte I </a>&nbsp;y <a href="http://agilismoatwork.blogspot.com.es/2012/09/estimacion-agil.html" target="_blank">parte II</a>.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 5, ambito_decision: 'producto/servicio', agile_method: "XP, Scrum" })
Practica.create!({id: 41, position: 6, name: "Organizar el trabajo en iteraciones que agrupan unidades de trabajo \
	que son entregadas en una fecha prevista.",
  description: '<p>Esta práctica es esencial en Scrum y Extreme Programming, ambos métodos proponen un proceso iterativo. En Scrum se denominan Sprints a las iteraciones. En Scrum un Sprint no debería durar más de cuatro semanas, en Extreme Programming se sugieren que no sean más de tres semanas. Esta práctica está condicionada a que efectivamente se pueda e interese agrupar el trabajo para prever o comprometer entregas asociadas a grupos de trabajo terminado. Esta situación es natural cuando se está desarrollando una primera entrega del producto o una entrega asociada a una modificación de gran envergadura, y cuando además dicha entrega podría tardar más de un mes. Esta práctica no es aplicable en situaciones en las cuales el equipo no puede agrupar el trabajo para acordarlo con el cliente o ni siquiera puede anticipar cuál es el trabajo que hará en el corto plazo.</p><p>Un ejemplo de la situación con la <strong>anti-práctica</strong> es el siguiente: el equipo acuerda con el cliente una fecha de entrega en varios meses por delante sin tener la posibilidad de retroalimentación parcial respecto del trabajo realizado hasta cierto momento. </p><p>La organización del trabajo en Sprints, además de ayudar al equipo y al cliente a confirmar que el trabajo va bien encaminado, ofrece otras ventajas tales como: establecer una "cadencia" o ritmo continuo de trabajo que favorece la fiabilidad del equipo, o realización de actividades que conviene aplicarlas en conjunto para un grupo de unidades de trabajo en lugar de hacerlas individualmente para cada una de ellas (tales como: documentación, pruebas de regresión, formación, instalación, etc.). </p>',
	effort: 3, ambito_decision: 'producto/servicio', agile_method: "XP, Scrum" })
Practica.create!({id: 50, position: 7, name: "Evitar invertir esfuerzo en adelantar trabajo que no esté comprometido \
	y/o no esté cercano a su entrega.",
  description: '<p>Esta práctica está inspirada en uno de los 7 Mudas (fuentes de desperdicio) de Lean Manufacturing, enunciado como: "Sobre-producción: producir mucho o con demasiada antelación". En procesos de desarrollo de software (o en ciertos servicios)  la consecuencia o problema de NO aplicar esta práctica no es tan evidente como en procesos que generan un producto físico, en los cuales se delata claramente la acumulación de unidades de trabajo terminadas y no entregadas (vendidas) al cliente, que probablemente provocará niveles de inventario no deseables en algunos puntos de la cadena de producción. Pero además de dicha posible acumulación de trabajo en curso o terminado, más grave aún puede ser el hecho que el trabajo adelantado llegue a quedar obsoleto y tenga que realizarse re-trabajo para actualizarlo, o incluso tenga que desecharse. </p><p>Ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: un equipo de desarrollo, en la medida que va recibiendo solicitudes de cambios en un producto software las va analizando en detalle y validando con el cliente. Luego resulta que por cuestiones de oportunidad de negocio, por otros cambios implementados previamente o por nuevos cambios solicitados, las solicitudes de cambios ya preparadas van perdiendo prioridad o simplemente quedan obsoletas respecto del estado actual del producto. La respuesta acertada a ¿cuándo convendría (y en qué medida) adelantar el comienzo de un trabajo? dependerá del contexto del producto o servicio (y de la unidad de trabajo en sí misma), pero esta práctica nos advierte en general del riesgo que conllevará invertir ese esfuerzo por adelantado.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 1, ambito_decision: 'equipo', agile_method: "Lean" })
Practica.create!({id: 44, position: 8, name: "Organizar el trabajo del equipo con el foco en la generación de un buen \
	flujo de trabajo terminado.",
  description: '<p>Cuando no se puede anticipar cuál es el trabajo que recibirá el equipo y no se quiere acumular trabajo para ser agrupado y establecer un plazo de entrega, o bien cuando se quiere dar una rápida respuesta a las solicitudes del cliente, especialmente a las pequeñas (que en caso de planificarse podrían verse aplazadas), en estos casos, el equipo se debería centrar en generar un buen flujo de trabajo terminado. Así pues, con esta práctica el trabajo en la medida que se recibe se ordena con respecto del resto de trabajo pendiente, y respetando dicho orden se va abordando. </p><p>Esta práctica es se presenta en el método Kanban con la idea de favorecer el flujo continuo de trabajo terminado, utilizando métricas de flujo tales como: unidades terminadas por unidad de tiempo (Production Rate), Cycle Time (tiempo promedio que tarda una unidad de trabajo en ser procesada hasta terminarse), y Lead Time (tiempo promedio que tarda una unidad de trabajo desde que se solicita hasta que se entrega).</p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: el equipo se esfuerza en vano intentando planificar el trabajo, en agruparlo, en contrastarlo con su capacidad y en negociarlo con el cliente, siendo que continuamente va recibiendo nuevos trabajos que obligan a re-planificar. </p><p>Si frecuentemente lo planificado difiere significativamente de lo que realmente se realiza, es cuestionable el esfuerzo invertido en la planificación y tareas asociadas. Sin embargo, esto no significa renunciar a evaluar cada trabajo que entra respecto del trabajo pendiente. Esto es crucial que todo el trabajo pendiente (incluyendo el recién llegado) esté siempre ordenado (debe priorizarse siguiendo los criterios que el cliente estime conveniente) para que el equipo lo vaya abordando en dicho orden.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'producto/servicio', agile_method: "Kanban" })
Practica.create!({id: 24, position: 9, name: "Gestión continua y multicriterio del trabajo pendiente para que esté \
	siempre debidamente priorizado.",
  description: '<p>Gran parte del éxito de un producto o servicio se basa en la adecuada priorización del trabajo de manera que el cliente vea satisfecha sus solicitudes que le aportan mayor valor, o aquellas que tienen un carácter urgente. La adecuada definición del trabajo que debe realizarse también es crucial para asegurar que el trabajo realizado satisface las expectativas del cliente. Así pues, el trabajo pendiente debe estar continuamente priorizándose de acuerdo con los cambios u oportunidades que se presenten en el negocio, junto con la entrada de nuevos trabajos solicitados por el cliente. Salvo urgencias, el trabajo antes de ser abordado por el equipo debería ser definido por el cliente y con apoyo del equipo. </p><p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: reaccionar de forma inmediata ante cualquier solicitud de trabajo llegada al equipo y atenderla, aunque no se trate de algo urgente, sin evaluarla contra el trabajo pendiente e incluso interrumpiendo el trabajo actual. Esto además de afectar la moral del equipo y provocar retrasos, puede llevar a que el producto o servicio que ofrece el equipo pierda el rumbo y no satisfaga globalmente a todos los clientes o usuarios. </p><p>Lectura recomendada: <a href="http://agilismoatwork.blogspot.com.es/2011/10/gestion-efectiva-del-product-backlog.html" target="_blank">Gestión efectiva del Product Backlog</a><a href="http://agilismoatwork.blogspot.com.es/2011/10/gestion-efectiva-del-product-backlog.html.">.</a></p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'equipo', agile_method: "Scrum" })
Practica.create!({id: 31, position: 10, name: "Limitar el trabajo en proceso (WIP), es decir, la cantidad de unidades \
	de trabajo que tiene el equipo en una determinada actividad.",
  description: '<p>Esta práctica es uno de los pilares del método Kanban, en el cual, además de promover la utilización de un tablero kanban, se destaca en la conveniencia de limitar el trabajo en proceso (WIP) en las actividades que puedan constituir un cuello de botella. La idea de limitar el WIP proviene de la TOC (Theory of Constraints, de Eliyahu M. Goldratt), la cual destaca que una línea de producción tiene un ratio de producción global (unidades de trabajo terminadas por unidad de tiempo) que está limitado por el punto de la línea que tiene el menor ratio de producción, y no tiene sentido que otros puntos con mayor ratio que el menor aumenten su ratio. Así pues, al limitar el WIP de las actividades se obliga a tomar medidas que evitan la acumulación de unidades de trabajo en ciertas actividades, por ejemplo, parar por períodos el trabajo en ciertas actividades (por ejemplo desviando recursos a las actividades con acumulación de trabajo), o implantar mejoras que permitan elevar o prescindir de l a limitación del WIP de una actividad. De todas formas, es importante destacar que estas ideas se originaron en líneas de producción de productos físicos, y deben extrapolarse con cautela en contexto de productos software o de servicios.</p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: tendencia a tener muchos trabajos comenzados y no terminados en una cierta actividad, intentando avanzarlos en paralelo, pasando de uno a otro a lo largo del tiempo (cuando no hay suficientes integrantes en el equipo que puedan efectivamente realizar el trabajo en paralelo). El rendimiento del equipo se resiente por los continuos cambios de contexto de trabajo que realizan los integrantes. Lecturas recomendadas: <a href="http://agilismoatwork.blogspot.com.es/2012/07/limitar-el-wip-una-buena-idea-pero-con.html" target="_blank">Limitar el WIP, una buena idea, pero con matices y alternativas</a> y <a href="http://agilismoatwork.blogspot.com.es/2012/12/actividad-tablero-kanban-concepto-de.html" target="_blank">Actividad: Tablero kanban + concepto de WIP + Diagramas de Flujo Acumulado</a>.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 2, ambito_decision: 'equipo', agile_method: "Kanban" })
Practica.create!({id: 45, position: 11, name: "Formar equipos pequeños y procurar que mantengan sus integrantes.",
  description: '<p>Las prácticas ágiles intensifican la comunicación y coordinación frecuente en los equipos de trabajo, y se prefiere que se dichas actividades se realicen cara a cara. Esto es difícil de llevar a cabo si el equipo es de gran tamaño. Scrum sugiere que los equipos deberían estar formados por entre 3 y 9 integrantes. Por otra parte, es importante que el equipo en lo posible se mantenga estable en cuanto a sus integrantes puesto que el equipo irá ganando cohesión. </p> <p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: cada vez que se plantea el desarrollo de un nuevo producto o un cambio significativo en un producto ya existente se arma un nuevo equipo de trabajo para abordar dicho proyecto, cogiendo personas desde equipos ya formados. Los equipos requieren un tiempo para llegar a un nivel adecuado de compenetración, para abordar inmediatamente un nuevo proyecto puede resultar más efectivo cambiar el ámbito de trabajo de un equipo ya formado que formar un nuevo equipo, especialmente si se quiere un respuesta rápida y fiable. Además, la frecuente rotación de integrantes puede afectar el desempeño de los equipos. </p> <p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: "XP, Scrum" })
Practica.create!({id: 43, position: 12, name: "Acotar el ámbito de trabajo de cada equipo.",
  description: '<p> Esta práctica tiene el propósito de especializar al equipo en un ámbito de acción. Puede verse desde dos perspectivas: la primera envergadura del producto o servicio, y la segunda, diversidad de trabajos. Cuando se trata un producto o servicio de gran envergadura se debe promover la creación de equipos por partes del producto o servicio (cuidando que esas partes no tengan demasiada dependencia entre ellas). A continuación se detalla más la perspectiva asociada a la diversidad de trabajos del equipo. Es importante limitar la cantidad de productos, de servicios y/o de proyectos en los que trabaja simultáneamente cada equipo especialmente si se deben realizar actividades muy diferentes en cada caso. En este aspecto esta práctica es similar a la que propone limitar el WIP (trabajo en proceso en una actividad), la diferencia es que el WIP se refiere a la cantidad de unidades de trabajo en una actividad, en cambio en esta práctica se refiere al número de productos, servicios o proyectos encargados a un equipo. </p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: tendencia a que involucrar al equipo en muchos proyectos abiertos pretendiendo que los aborde en paralelo. En rendimiento del equipo se vería claramente resentido por tener que gestionar su capacidad distribuyéndola en los diferentes proyectos y teniendo que hacer cambios de contexto al cambiar de un proyecto a otro. Lecturas recomendadas: Agilismo en un contexto multi-proyecto, <a href="http://agilismoatwork.blogspot.com.es/2012/11/agilismo-en-un-contexto-multi-proyecto.html" target="_blank">parte I</a> &nbsp;y <a href="http://agilismoatwork.blogspot.com.es/2012/11/agilismo-en-un-contexto-multi-proyecto_23.html" target="_blank">parte II</a><a href="http://agilismoatwork.blogspot.com.es/2012/11/agilismo-en-un-contexto-multi-proyecto_23.html.">.</a></p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'equipo', agile_method: "" })
Practica.create!({id: 3, position: 13, name: "Seguimiento continuo (frecuencia de días, no semanas).",
  description: '<p>La intensidad y frecuencia del seguimiento depende del contexto del trabajo, y en particular depende de si la demanda es o no planificable. Cuando la demanda NO es planificable el seguimiento se basará en la visualización del estado del trabajo y en métricas de flujo de trabajo terminado (por ejemplo, unidades de trabajo terminadas por unidad de tiempo, tiempo de procesamiento, o tiempo de entrega desde que se solicitó el trabajo). Si la demanda es en cierta medida planificable, adicionalmente como seguimiento podemos contrastar el progreso del trabajo con el trabajo restante para el período planificado, comprobando si es posible cumplir los acuerdos respecto de la entrega.</p><p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: hacer el seguimiento cada 2 o 3 semanas. Mientras menos frecuente sea el seguimiento mayor puede ser la desviación respecto de lo esperado, en proyectos en los cuales existen muchos cambios, el seguimiento continuo y frecuente es esencial. Además, es importante que el equipo al completo se interese por el seguimiento, tanto a nivel de las actividades encargadas a cada integrante como a nivel de los compromisos del equipo.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: "Kanban, XP, Scrum"})
Practica.create!({id: 28, position: 14, name: "Realizar una reunión diaria del equipo al completo, cara a cara y \
	muy breve.",
  description: '<p>Esta reunión se llama "Stand-up Meeting" en Extreme Programming y "Daily Scrum" en Scrum, y se refiere a una reunión que realiza el equipo al iniciar su jornada de trabajo, es una reunión de pie en semi-círculo ojalá frente a la visualización de trabajo del equipo, y dura no más de 15 minutos. </p><p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: el equipo solo se reúne al completo y cara a cara al comienzo y al final del proyecto o al alcanzar algún hito, dejando mucho tiempo sin reunirse todos. El propósito de estas reuniones es que todo el equipo esté enterado de lo que se está haciendo y sus posibles impedimentos, promoviendo la colaboración entre los miembros del equipo y reforzando el compromiso con los objetivos del equipo, por sobre las responsabilidades individuales.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 1, ambito_decision: 'equipo', agile_method: "XP, Scrum" })
Practica.create!({id: 8, position: 15, name: "Visualización de todo el trabajo pendiente encargado al equipo.",
  description: '<p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: solo el jefe del proyecto conoce el estado global del proyecto y el trabajo que resta por hacer, esa información se la presenta puntualmente al resto del equipo, normalmente no está siempre visible o disponible, y si así fuera, no está actualizada. Obviamente esta situación no es la más propicia para generar colaboración, cada miembro tenderá solo a conocer o preocuparse por lo que tiene encargado.</p><p>La visualización debería ser más completa y mostrar no solo en qué actividad y quién tiene cada trabajo, sino que debería además permitir que los miembros del equipo sepan los trabajos no terminados en los cuales están participando, incluso cuando todavía no tienen que realizar ninguna acción sobre ellos (por ejemplo, conocer lo que te llegará como trabajo o en lo que ya has participado pero que aún no está terminado). Además, dicha visualización debería conllevar el principio de transparencia indicado por Scrum, según el cual cada miembro del equipo debe tener acceso a toda la información que pueda serle útil del contexto de su trabajo (toda la información de los proyecto o productos en los cuales participa). Las visualizaciones más efectivas están basadas en tableros kanban, los cuales pueden ser físicos (en una pared) o soportados por alguna herramienta software. Lecturas recomendadas <a href="http://agilismoatwork.blogspot.com.es/2011/10/desafios-para-la-aplicacion-efectiva-de.html" target="_blank">Desafíos para la aplicación efectiva de Scrum + kanban = Scrumban</a><span style="line-height: 1.3em;">, <a href="http://agilismoatwork.blogspot.com.es/2012/05/kanban-for-free-una-evaluacion-informal.html" target="_blank">Kanban for Free. Una evaluación informal de 5 herramientas totalmente gratuitas</a>.</span></p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'equipo', agile_method: "" })
Practica.create!({id: 30, position: 16, name: "Gestión integrada de todo el trabajo asignado, tanto a nivel del equipo \
	como a nivel de cada miembro.",
  description: '<p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: se le asigna un trabajo a un miembro o a un equipo sin contrastarlo con el trabajo que ya tiene asignado y sin proporcionar pautas respecto a las correspondientes prioridades. </p><p>La gestión integrada del trabajo pendiente y de su priorización es el primer paso para conseguir que los miembros del equipo estén siempre trabajando en lo más oportuno. Si bien no es lo ideal que un equipo o integrante trabaje en varios productos y/o servicios, es una situación bastante usual y difícil de cambias. Esto provoca que la gestión integrada de todo el trabajo del equipo sea un desafío, pues un simple tablero kanban de pared probablemente no será suficiente, una opción más adecuada es disponer de una herramienta software que ofrezca soporte para gestionar de forma integrada varios tableros kanban. Lecturas recomendadas: Agilismo en un contexto multi-proyecto, <a href="http://agilismoatwork.blogspot.com.es/2012/11/agilismo-en-un-contexto-multi-proyecto.html" target="_blank">parte I</a> &nbsp;y <a href="http://agilismoatwork.blogspot.com.es/2012/11/agilismo-en-un-contexto-multi-proyecto_23.html" target="_blank">parte II</a><a href="http://agilismoatwork.blogspot.com.es/2012/11/agilismo-en-un-contexto-multi-proyecto_23.html.">.</a></p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'equipo', agile_method: "" })
Practica.create!({id: 9, position: 17, name: "Cliente en estrecho contacto con el equipo y altamente disponible, \
	incluso si es posible, que esté in-situ",
  description: '<p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: el equipo debe pedir reuniones al cliente para aclarar cuestiones respecto del problema que solicitó resolver, esto conlleva esperar horas o días, con lo cual se producen retrasos y obliga a que mientras tanto se trabaje en otras cosas, penalizando el  rendimiento del equipo por los cambios de contexto al cambiar de trabajo.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 5, ambito_decision: 'producto/servicio', agile_method: "XP, Scrum"})
Practica.create!({id: 18, position: 18, name: "Que exista una única persona que tome las decisiones respecto de las \
	prioridades del trabajo del equipo y que sea un buen representante de la parte cliente",
  description: '<p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: el equipo, incluso cualquiera de sus miembros recibe solicitudes de diferentes clientes para resolver sus particulares necesidades, y deben ellos mismos establecer las prioridades para organizar su dedicación a cada solicitud de trabajo. </p><p>Se debería "proteger" al equipo del ruido que le puede suponer su exposición directa a las solicitudes de los clientes y al despropósito que conllevaría que el equipo tome decisiones de negocio (prioridades de las solicitudes). Así pues, es importante establecer una barrera entre el día a día del equipo y la nueva demanda que se va generando, debe existir un solo interlocutor que represente a la parte cliente y que le proporcione al equipo las prioridades del trabajo pendiente.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'producto/servicio', agile_method: "XP, Scrum"})
Practica.create!({id: 26, position: 19, name: "Realizar reuniones de revisión del trabajo entregado",
  description: '<p>Estas reuniones corresponden a las "Review Meetings" de Scrum. En estas reuniones el equipo se reúne con representantes de la parte cliente para presentar el trabajo realizado. </p><p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: si bien el equipo cumple con los plazos y compromisos, esto pasa desapercibido para el cliente (existen casos en los que incluso el cliente llegar a solicitar algo ya realizado por desconocer que ya está hecho). Estas reuniones debe servir para remarcar el cumplimiento de lo acordado con el cliente, es importante que el equipo tenga esta oportunidad para "lucir" y divulgar el trabajo realizado.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 2, ambito_decision: 'equipo', agile_method: "Scrum"})
Practica.create!({id: 13, position: 20, name: "El equipo se auto-organiza y toma las decisiones técnicas",
  description: '<p>Proviene del concepto "self-organizing team" de Scrum. Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: los miembros del equipo están acostumbrados a recibir instrucciones respecto de qué deben hacer, cuándo y cómo, careciendo de iniciativa o evitando asumir decisiones técnicas en el trabajo.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'equipo', agile_method: "Scrum"})
Practica.create!({id: 37, position: 21, name: "Jefe de carácter líder y facilitador en lugar de actitud del jefe \
	autoritario y controlador",
  description: '<p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: el jefe del proyecto asigna el trabajo a cada miembro del equipo y controla su progreso. Situaciones como estas desbordan a los jefes de proyecto en desmedro de su desempeño en la gestión global del proyecto, comunicación con la parte cliente y con los niveles de dirección superiores.</p><p>El planteamiento de Scrum es radical al respecto: no existe el rol de jefe. El rol  Producto Owner incluye las responsabilidades de: representar a la parte cliente, definir y priorizar el trabajo, organizando qué trabajo debe abordar el equipo. Es rol Scrum Master se encarga de apoyar en cuanto a la implantación y correcta aplicación de la metodología de trabajo y de su mejora continua. Ni el Product Owner ni el Scrum Master indican al equipo quién o cómo debe llevar a cabo el trabajo técnico. En Extreme Programming existe el rol Manager, caracterizado como facilitador, encargado de resolver inconvenientes que pueda tener el equipo para realizar su trabajo. El planteamiento de Scrum, si bien es ideal, es difícil de implantar, al menos en contextos donde el rol de jefe tradicional está muy arraigado. El plantemiento de Extreme Programming respecto del rol Manager ofrece menos resistencia y podría servir de evolución hacia al escenario de Scrum.<p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'equipo', agile_method: "XP, Scrum"})
Practica.create!({id: 5, position: 22, name: "Co-localización de los miembros del equipo, todo el equipo trabajando \
	en el mismo espacio físico.",
  description: '<p>Un ejemplo de situación con la <strong>anti-práctica</strong> sería: un miembro del equipo requiere comentar alternativas de solución para un trabajo que está realizando, si se trata de algo complicado de explicar por chat, email o videoconferencia, lo más efectivo sería tener una reunión inmediata para no tener que parar su trabajo, pero esto no es posible porque el equipo no está físicamente en el mismo sitio.</p><p>Si bien contando con las actuales alternativas de comunicación, especialmente videoconferencias, puede compensarse en gran medida los inconvenientes de no tener un contacto cara a cara in-situ, difícilmente se consigue la misma eficacia de comunicación del contacto in-situ, pues los aspectos gestuales o en general la comunicación no verbal no se consigue transmitir completamente.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 2, ambito_decision: 'equipo', agile_method: "XP, Scrum"})
Practica.create!({id: 49, position: 23, name: "Contar con un espacio físico de trabajo que favorezca la interacción \
	entre los miembros del equipo.",
  description: '<p>Si bien no es una de las 12 prácticas de Extreme Programming, allí donde se pone énfasis en el espacio de trabajo del equipo, un espacio abierto (sin módulos), sillas con ruedas, pizarras en las paredes, un área para hablar por teléfono, un área para comer y conversar informalmente, etc. En el contexto Lean también el espacio de trabajo, referido como el "Gemba", tiene cierto protagonismo.</p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> sería:  un equipo trabajando en un espacio organizado en cubículos y sin un área cercana para poder improvisar una reunión, lo cual no favorece para que los miembros de forma natural se animen a comunicarse cara a cara. Por contraparte, el extremo opuesto lo constituiría lo que se denomina "War room", un espacio relativamente reducido sin ninguna delimitación de espacios individuales, y en el cual el equipo, ante una situación de emergencia podría, basándose en una interacción codo-a-codo, daría una pronta solución a un problema. Entre estos extremos hay un amplio abanico de alternativas, y si bien la intención debería ser alejarse del extremo asociado a un espacio con cubículos, también hay que considerar que un "War room", aunque puede ser efectivo en situaciones puntuales y por períodos cortos, no sería recomendable como espacio de trabajo habitual.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: "XP"})
Practica.create!({id: 47, position: 24, name: "Establecer y comunicar al equipo la visión del producto o servicio, \
	y reforzarla regularmente.",
  description: '<p>La Visión de un producto o servicio es básicamente su información respecto de: propósito y motivación,  principales características, tipos de usuarios, productos o servicios competidores, fortalezas y debilidades, amenazas y oportunidades. Si bien en un enfoque tradicional la recolección y especificación de esta información podría tomar un tiempo considerable y generar un documento voluminoso. Desde una perspectiva más ágil la idea sería conseguir un documento muy simplificado, con lo esencial, o bien podría incluso bastar con que el equipo esté en conocimiento de dicha información aunque no esté explícitamente escrita. En Extreme Programming la práctica Metáfora tiene un propósito similar a la Visión, y consiste en que el equipo conozca y sea capaz de relatar lo esencial del producto que se está desarrollando. En Scrum el concepto de Goal del sprint también tiene algo en común con la Visión, y permite destacar dentro de todo el trabajo de un sprint aquello que es lo esencial, representado por algunos de los ítems del sprint. Conocer la Visión del producto le proporciona al equipo un contexto para su trabajo, lo cual debería influir positivamente en su motivación y compromiso. </p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> sería: un equipo desconcertado por las prioridades establecidas por el cliente (que obviamente deberían estar alineadas con la Visión) y correspondientemente menos comprometido o motivado por no comprender el aporte de su trabajo al éxito del producto o servicio. </p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 1, ambito_decision: 'equipo', agile_method: "XP"})
Practica.create!({id: 6, position: 25, name: "Que el equipo sume entre sus miembros las habilidades para abordar \
	todas las actividades necesarias para terminar el trabajo.",
  description: '<p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: algunas de las actividades necesarias para realizar un trabajo deben encargarse a otras unidades, equipos o incluso empresas externas (Outsourcing), y para esto se debe seguir un protocolo de solicitud y entrega de trabajo, lo cual sumado al usual re-trabajo por correcciones de defectos en la entrega ocasiona importantes retrasos. </p><p>Esta práctica corresponde al concepto de equipo cross-functional planteado es Scrum. Es indudable que la concentración de ciertas funciones en ciertas unidades en una empresa ofrece las ventajas de la especialización y permite realizar economías de escala, pero como contraparte puede constituir un cuello de botella para terminar trabajo que depende en parte de la participación de dichas unidades, y suele ralentizar el flujo de trabajo por el necesario protocolo de interacción con dichas unidades. La situación es similar en caso del Outsourcing, pero se acentúan los inconvenientes porque existe un contrato con un proveedor y el protocolo de interacción suele ser más ceremonioso. Lectura recomendada <a href="http://agilismoatwork.blogspot.com.es/2013/04/outsourcing-y-practicas-agiles-pueden.html" target="_blank">Outsourcing y prácticas ágiles: ¿pueden convivir?</a>. </p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 5, ambito_decision: 'equipo', agile_method: "Scrum"})
Practica.create!({id: 42, position: 26, name: "Que los integrantes del equipo puedan encargarse de diferentes tipos \
	de actividades (ojalá de todas), aunque puedan ser especialistas en alguna(s) de ellas.",
  description: '<p>Un ejemplo de la situación con la <strong>anti-práctica</strong> es el siguiente: el único integrante del equipo que realiza una determinada actividad no está disponible o tiene demasiado trabajo en dicha actividad, los otros integrantes del equipo no pueden echar una mano porque no trabajan en esta actividad, debido a esto la actividad se convierte en un cuello de botella para el proceso. </p><p>Sin descartar la especialización y los beneficios que ella conlleva, siempre hay trabajos de menor tamaño/complejidad en los cuales no es imprescindible un alto grado de especialización en la actividad que debe realizarse. En este caso podría encargarse de ellos cualquier integrante del equipo, o al menos colaborar con el especialista trabajando bajo su supervisión.</p><p>Los métodos ágiles promueven los roles más genéricos para acotar lo menos posible las actividades que puede desempeñar un integrante del equipo. En Scrum en el equipo sólo existe el rol "Desarrollador" el cual se encarga de todo el trabajo técnico. En Extreme Programming respecto del trabajo técnico se reconoce el rol Programador (el cual desde la perspectiva tradicional sería un analista, programador y tester en los niveles unitario, de integración y de sistema), y el rol tester (encargado de las pruebas de aceptación). Obviamente, tener estos roles más genéricos puede entrar en conflicto con las estructura de puestos de la organización, en la cual se suele hacer énfasis en roles más específicos y en sus correspondientes escalas de remuneración. </p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'equipo', agile_method: "Scrum"})
Practica.create!({id: 2, position: 27, name: "Trabajo centrado en satisfacer pruebas de aceptación acordadas \
	con el cliente.",
  description: '<p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: el equipo entrega un producto terminado al cliente pero éste lo rechaza porque no se comporta según lo esperado, el problema fue que por omisión o mala interpretación no se cumplen ciertas expectativas.</p><p>Aunque aparentemente pareciera que es suficiente que una especificación del trabajo incluya una combinación de texto descriptivo y algunos modelos u otros complementos, si no se establece con precisión el criterio de aceptación desde la perspectiva del cliente siempre habrá lugar para dichas situaciones de no conformidad. Ese criterio de aceptación no es más ni menos que un conjunto de pruebas que el cliente aplicaría para considerarse satisfecho con la entrega. Con lo cual en el mismo momento de la definición del trabajo deben quedar establecidas y acordadas con el cliente las pruebas de aceptación. Lectura recomendada: <a href="http://agilismoatwork.blogspot.com.es/2011/12/gestion-de-requisitos-agil.html" target="_blank">Gestión ágil de requisitos</a>.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'equipo', agile_method: "XP"})
Practica.create!({id: 4, position: 28, name: "Documentar, pero solo lo estrictamente necesario. Que sea rentable \
	el aprovechamiento de la documentación respecto del esfuerzo asociado a elaborarla.",
  description: '<p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: exigido por el proceso establecido para toda la empresa el equipo se ve obligado a elaborar documentación que saben que no les resulta útil ni a ellos ni a quienes reciben la entrega.</p><p>Suele ocurrir, especialmente en empresas grandes, donde se ha hecho una importante inversión para establecer una metodología de trabajo global, y para la cual no se hace una configuración adecuada a las necesidades de cada proyecto. Especialmente en proyectos pequeños se corre el riesgo de sobre-documentar. Lean Development insiste en eliminar toda forma de desperdicio ("waste"), es decir, trabajo que no aporta valor para el cliente. La documentación suele ser una fuente importante de desperdicio de esfuerzo. Cuando el trabajo sufre constantes cambios sobre la marcha, pretender mantener actualizada la documentación puede ser un gran desperdicio. La mínima especificación necesaria para llevar a cabo un trabajo es conocer el criterio de aceptación que aplicará el cliente, cualquier otra especificación requerida para la entrega podría generarse de forma detallada y completa una vez que el resultado adquiera cierta estabilidad, evitando o reduciendo dicho desperdicio.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: "Lean"})
Practica.create!({id: 48, position: 29, name: "Establecer pautas para gestionar convenientemente el \
	re-trabajo.",
  description: '<p>El re-trabajo corresponde al esfuerzo gastado por volver a repetir alguna actividad asociada a un trabajo por haberse detectado defectos durante el proceso. Evidentemente el re-trabajo tiene una connotación negativa y constituye una medida importante para evaluar el desempeño de un proceso. Si bien, y dependiendo del contexto de trabajo, el re-trabajo suele ser inevitable, el objetivo es reducirlo a su mínima expresión. Esta práctica no proporciona la solución sino que más bien enfatiza el hecho que el equipo debe tener claramente establecidas pautas para actuar frente a situaciones de re-trabajo. Cuestiones tales como la priorización del trabajo asociado a corrección de fallos, o cualquier otro tratamiento específico para el re-trabajo debe estar consensuado por todo el equipo. Estas pautas deben evaluarse y mejorarse continuamente. </p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: el tester A tiene por costumbre devolver la unidad de trabajo al programador cada vez que detecta un fallo, por otra parte, el tester B lo que hacer es detectar todos los fallos y luego devolver la unidad de trabajo al programador. Ambas estrategias parecen razonables, sin embargo, cada una tiene sus ventajas y desventajas dependiendo de por ejemplo: el número de pruebas asociadas a la unidad de trabajo, si el tester puede continuar probando después de detectar fallos, si como parte del trabajo se incluye automatización de pruebas, etc. En este caso, dependiendo del contexto del producto o servicio, de la unidad de trabajo, y de sus pruebas, podría ser más aconsejable una u otra estrategia. </p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 1, ambito_decision: 'producto/servicio', agile_method: "Lean"})
Practica.create!({id: 14, position: 30, name: "Que exista un líder de mejora de proceso disponible \
	para el equipo.",
  description: '<p>Esta práctica corresponde a la implantación del rol "Scrum Master" promovido por Scrum o el similar llamado "Coach" en Extreme Programming. </p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: no existe una persona que promocione y apoye la mejora del proceso, no existe una canalización de las iniciativas de mejora que puedan aportar los miembros del equipo, cualquier mejora que llega a implantarse suele provenir del esfuerzo heroico y poco reconocido de alguno de los miembros del equipo.</p><p>Indudablemente no es fácil implantar un sistema de mejora continua, se requiere motivación y compromiso de todos los miembros del equipo, pero además, un complemento imprescindible es el apoyo institucional materializado en un líder de mejora que pueda asesorar al equipo en la mejora de sus métodos de trabajo. Este líder debe estar en estrecho contacto con el equipo.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: "XP, Scrum"})
Practica.create!({id: 17, position: 31, name: "Establecimiento de estándares para el trabajo técnico \
	del equipo",
  description: '<p>Esta práctica se propone en Extreme Programming como "Estándares de Programación". La estandarización es fundamental para independizar el trabajo de la persona que puede realizarlo y a su vez garantizar un nivel de calidad asociado al proceso estandarizado. </p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: si bien el equipo realiza entregas de trabajo aceptadas por el cliente, cada miembro del equipo utiliza técnicas y métodos diferentes para realizar las actividades que se le encargan, esto conlleva dificultades cuando otros integrantes del equipo deben hacer modificaciones. </p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'producto/servicio', agile_method: "XP"})
Practica.create!({id: 27, position: 32, name: "Realizar reuniones de retrospectiva para evaluar el \
	desempeño del equipo y sus formas de trabajo. Mejora continua del proceso.",
  description: '<p>Estas reuniones corresponden a las "Retrospective Meetings" de Scrum. </p><p>Un ejemplo de situación con la <strong>anti-práctica</string> es el siguiente: no existe un mecanismo establecido y regular para que surja la auto-crítica respecto del desempeño del equipo y de su método de trabajo, esto hace que sólo después de problemas graves se reaccione tomando acciones preventivas o de mejora, muchas imperfecciones o ineficiencias conocidas pero no graves pueden mantenerse largo tiempo sin que lleguen a abordarse y buscarles solución.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: "Scrum"})
Practica.create!({id: 33, position: 33, name: "Acordar y definir qué se entiende por trabajo terminado, \
	tanto para las actividades realizadas por el equipo como respecto de las entregas al cliente",
  description: '<p>Esta práctica corresponde a lo que Scrum denomina “Definition of DONE”, refiriéndose al hecho que el equipo y el cliente deben tener acordado qué se entiende por trabajo terminado. Esto es importante pues para cada contexto de cliente-equipo-producto/servicio, el acuerdo respecto a qué se entiende por trabajo terminado puede variar, afectando a aspectos tales como la documentación que debe acompañar a la entrega, niveles de pruebas superados, o cualquier protocolo o actividades asociadas a la terminación de un trabajo. </p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: cuando no está claramente establecido y consensuado el criterio para terminar una actividad, la interpretación de un miembro puede ser incorrecta y afectar la calidad esperada de la entrega, esto también puede ser una fuente de re-trabajo, es decir, cuando se devuelve un trabajo hacia actividades previas, en este caso por no haberse realizado de forma completa o según lo esperado.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'producto/servicio', agile_method: "Scrum"})
Practica.create!({id: 12, position: 34, name: "Trabajo o actividades realizadas en conjunto por dos o más \
	integrantes",
  description: '<p>Proviene de la práctica "Programación en Parejas" de Extreme Programming. Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: si bien los miembros del equipo colaboran realizando diferentes actividades asociadas a una misma unidad de trabajo, no llegan a colaborar en una misma actividad, solo se van pasando entre ellos la unidad de trabajo para que cada uno realice la actividad encargada.</p><p>Muchas veces cuando un trabajo es de cierta envergadura y/o complejidad para poder abordarlo entre varias personas se intenta a priori dividirlo, lo cual no suele ser sencillo y conlleva desafíos de coordinación. Una alternativa interesante y más sencilla en cuanto a coordinación es considerar que en algunas actividades trabaje más de una persona. Los encargados de realizar la actividad, al momento de llevarla a cabo podrían repartirse el trabajo si les resulta conveniente, pero con una coordinación resuelta en dicho momento y entre ellos.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 2, ambito_decision: 'equipo', agile_method: "XP"})
Practica.create!({id: 32, position: 35, name: "No abusar de las horas extras, negociar y \
	re-planificar oportunamente para evitarlo",
  description: '<p>Esta práctica corresponde a lo que aparece en el principio del Manifiesto Ágil referente a "desarrollo sostenible" y "paz constante" ("Agile processes promote sustainable development. The sponsors, developers, and users should be able to maintain a constant pace indefinitely"). Extreme Programming destaca este aspecto en su práctica "Semana de 40 horas". </p><p>Un ejemplo de una situación con la <strong>anti-práctica</strong> es el siguiente: sistemáticamente tener un muy bajo grado de tensión al comenzar un proyecto y por contra un alto grado de tensión cuando se acercan los plazos de entrega, presentándose el típico síntoma de requerir horas extras para poder cumplir con los plazos.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: "XP"})
Practica.create!({id: 35, position: 36, name: "Reducir las interrupciones o cambios de contexto que \
	afectan en su trabajo a los miembros del equipo",
  description: '<p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: un integrante del equipo para solucionar una duda respecto de su trabajo se acerca e interrumpe el trabajo de otro integrante y ambos mantienen una conversación de alrededor de media hora, cuando el miembro que ha sido interrumpido retoma su trabajo gasta bastantes minutos en volver a centrarse en lo que estaba realizando previamente. </p><p>Deben existir unas pautas básicas para la utilización de los diversos medios de comunicación (cara a cara, mensajería instantánea, teléfono, videoconferencia, email o reuniones) para así conseguir un mejor desempeño global. La clave está en, por un lado, consensuar aproximadamente qué debe considerarse tan urgente como para justificar estas interrupciones sin optar por otra alternativa, y por otro, cuándo una interrupción no es tal, es decir, el integrante interrumpido realmente no se ve perjudicado por la interrupción ya sea por estar disponible o porque la interrupción es muy breve. </p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 2, ambito_decision: 'equipo', agile_method: "Lean"})
Practica.create!({id: 7, position: 37, name: "Establecer una disciplina de aprovechamiento de las reuniones",
  description: '<p>La introducción de prácticas ágiles conlleva intrínsecamente mayor comunicación entre los miembros del equipo y con el cliente. El entusiasmo de los miembros del equipo ante lo que puede ser una oportunidad nueva de apertura a su participación y su aportación debe ser adecuadamente conducido. Gran parte de dicha comunicación y participación de canaliza a través de reuniones. Pero estas reuniones pueden llegar a ser muy improductivas si no existe una buena disciplina para llevarlas a cabo.</p><p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: reuniones sin un buen moderador, sin la correcta elección de asistentes, sin una preparación o distribución de información anticipada, sin un registro de los acuerdos o sin ningún control respecto de su duración, con todo esto es difícil que una reunión sea eficiente y eficaz.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: ""})
Practica.create!({id: 10, position: 38, name: "Automatizar las pruebas para poder garantizar que el producto \
	mantiene el comportamiento deseado cuando se realizan cambios",
  description: '<p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: el equipo gasta mucho tiempo en realizar actividades repetitivas o muy estructuradas que podrían ser automatizadas.</p> <p>Las actividades de pruebas son en general muy atractivas para ser automatizadas pues el esfuerzo invertido en ellas puede rentabilizarse en la ejecución frecuente de pruebas de regresión (pruebas que se repiten después de hacer un cambio para asegurar que no se ha estropeado algún comportamiento ya implementado en el producto). Cuando un producto está mejorándose continuamente y se hacen entregas frecuentes al cliente, todo este esfuerzo puede incluso llegar a ser valorado negativamente por el cliente si se estropean funcionalidades ya disponibles antes de la última entrega. La automatización está en bastante sintonía con el agilismo, sin embargo, conseguir la infraestructura de soporte para automatizar procesos (herramientas y otros recursos), debe ser evaluado en términos de la inversión y tiempo que se requerirá para ponerla en aplicación y del ahorro o mejora que se conseguirá. La automatización de pruebas es una de las prácticas que requiere mayor preparación y su rentabilización se consigue a mediano y largo plazo. El testing es un área muy amplia, existiendo diversidad de tipos de pruebas (unitarias, de integración, de aceptación, de rendimiento, etc.), multitud de herramientas y muchísimas estrategias para implantar el testeo automatizado en un determinado contexto. Por otra parte, cada prueba definida puede ser aplicada con muchísimas (o infinitas) combinaciones de valores que intervienen en el escenario asociado. El diseño de la prueba debería considerar las instanciaciones más interesantes para ser aplicadas. Así pues, en general, no será posible automatizar todo, ni en todos los tipos de pruebas, ni en todas las combinaciones de valores para cada prueba, con lo cual habrá que ser selectivo también en cuanto a qué pruebas se automatizarán. Sin embargo, esta elección tampoco no es sencilla, el criterio general sería automatizar aquello que tenga mayor probabilidad de fallar o para lo cual un fallo pueda tener consecuencias importantes para el usuario. </p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 5, ambito_decision: 'producto/servicio', agile_method: "XP"})
Practica.create!({id: 39, position: 39, name: "Postergar hasta último momento la asignación del encargado de \
	realizar una actividad. ",
  description: '<p>Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: el trabajo se pre-asigna a encargados de realizarlo mucho antes que se vayan a poner a trabajar en esas actividades, muchas veces esto es motivado por el deseo de realizar una previsión de balanceo de carga entre los miembros del equipo. Posteriormente, por cuestiones de la dinámica del trabajo, algunos miembros se quedan ociosos mientras que otros no han podido abordar todo el trabajo previsto, y como el trabajo está pre-asignado hay que estudiar la situación y aplicar re-asignaciones. Sin embargo, es mucho más sencillo que los miembros del equipo se asignen a trabajos en el momento que terminan lo que estaban realizando y respetando las prioridades u orden del trabajo previamente establecido.</p><p>El trabajo del equipo, dependiendo del contexto, puede ser altamente dinámico, las unidades de trabajo pueden sufrir esperas no previstas y cambios que alteran su estimación, los integrantes del equipo pueden ser interrumpidos o tener que cambiar a otros trabajos por cambios de prioridades o por verse obligados a distribuir su capacidad en varios trabajos asignados. La pre-asignación demasiado anticipada conlleva un riesgo importante en cuando a ineficiencias en el aprovechamiento de los recursos humanos.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 2, ambito_decision: 'equipo', agile_method: ""})
Practica.create!({id: 11, position: 40, name: "Integrar de forma continua en el producto el trabajo terminado",
  description: '<p>Proviene de la práctica "Integración Continua"de Extreme Programming. Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: los miembros del equipo van terminando partes del trabajo pero lo conservan sin integrarlo con el resto del trabajo, más tarde al integrar las diferentes unidades de trabajo en las que está trabajando el equipo aparecen inconvenientes no previstos, lo cual provoca retrasos que pueden tener consecuencias en la planificación especialmente cuando la integración se realiza cerca de cumplirse los plazos de entrega.</p><p>Cuando varias personas colaboran en un trabajo solapándose en cuanto al resultado que debe obtenerse, y particularmente cuando se realizan cambios en paralelos en partes compartidas, es necesario gestionar los cambios y versiones de los artefactos generados, y además, tener una disciplina de integración continua para que todo el equipo disponga de la información más actualizada cuando está realizando su trabajo. Esto no solo es aplicable al ámbito del código fuente en un equipo de desarrollo de software sino también al trabajo colaborativo sobre cualquier tipo de documentos, en equipos de cualquier ámbito.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: "XP"})
Practica.create!({id: 15, position: 41, name: "Promover que los miembros del equipo en su trabajo lleguen a conocer todas \
	las partes del producto o servicio que han sido encargadas al equipo.",
  description: '<p>Se refiere a la práctica "Propiedad Colectiva" de Extreme Programming. Un ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: los miembros del equipo se especializan en una parte del producto o servicio y se hacen imprescindibles para ser asignados al trabajo en dichas partes. Si el especialista no está disponible cuando hay que trabajar en esa parte se crea un problema por el riesgo que puede suponer que alguien sin la experiencia realice dicho trabajo.</p><p>Es importante destacar que en productos o servicios de gran envergadura, y como contraparte, probablemente trabajarán muchas personas. Existe consenso en los métodos ágiles respecto de que los equipos deben ser pequeños (a modo orientativo: menos de 10 integrantes). En estos casos lo recomendado sería organizar equipos pequeños coordinados para abordar partes del trabajo en el producto o servicio. Asociado a esto, en el ámbito de Scrum se habla de hacer "Scrum de Scrums". Al margen de los desafíos asociados a la coordinación y centrándonos en la práctica que estamos comentando, hay que destacar que el alcance de "propiedad colectiva" que se promueve está limitado por el alcance del ámbito de responsabilidad encargada al equipo sobre el producto o servicio. Es decir, si un equipo está encargado de una parte del producto, la idea es que los miembros de ese equipo lleguen a tener experiencia trabajando en todos los elementos de dicha parte del producto.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 3, ambito_decision: 'equipo', agile_method: "XP"})
Practica.create!({id: 16, position: 42, name: "Mejorar continuamente la organización interna del producto para facilitar \
	su mantenimiento.",
  description: '<p>Corresponde a la práctica "Refactoring" de Extreme Programming, que consiste en mejorar la arquitectura del producto sin cambiar su funcionalidad (sin cambiar su comportamiento externo).</p><p>Ejemplo de situación con la <strong>anti-práctica</strong> es el siguiente: si no hay una preocupación y dedicación constante por la mejora de la arquitectura, ésta probablemente se irá degradando con los cambios asociados a los mantenimientos del producto.</p><p>Una buena arquitectura interna del producto es clave para facilitar el mantenimiento, las pruebas y la reutilización, con lo cual debería ser un objetivo de cualquier metodología, sin embargo, las estrategias para conseguirlo pueden ser muy diferentes, y lo son. La estrategia tradicional es invertir un importante esfuerzo al inicio del desarrollo del producto (especificando y modelando intensamente), antes de comenzar a construirlo. Por contraparte, la estrategia ágil es iniciar rápidamente la construcción del producto para poder cuanto antes ir consiguiendo la confirmación del cliente, al menos de lo construido hasta el momento. Esta estrategia ágil conlleva que la preocupación por la arquitectura se centre principalmente en la parte del producto que se está construyendo en el momento, limitando el esfuerzo de especificación o modelado, y asumiendo el riesgo del re-trabajo que posteriormente puedan suponer las mejoras de arquitectura necesarias para garantizar que en última instancia también se conseguirá una buena arquitectura. La refactorización debería aplicarse continuamente, como parte de cualquier trabajo sobre el producto, es decir, no debería acumularse el trabajo de refactorización para hacerlo puntualmente cuando la arquitectura ya está obstaculizando de forma significativa el mantenimiento, las pruebas o la reutilización. Es importante destacar que la refactorización debe estar acompañada de buenos mecanismos para probar el comportamiento externo del producto y así asegurar que estos cambios de organización interna del producto no se están afectando dicho comportamiento. Lectura recomendada: <a href="http://agilismoatwork.blogspot.com.es/2011/11/cuando-y-como-el-trabajo-de.html" target="_blank">¿Cuando y cómo el trabajo de arquitectura cobra protagonismo en el contexto ágil?</a>.</p><p style="text-align: center;">&nbsp;</p><p style="text-align: center;"><a href="http://agilismoatwork.blogspot.com.es/2013/02/carta-de-practicas-agiles-arma-tu.html" target="_blank">Ver la lista y descripción de todas las prácticas</a></p>',
	effort: 4, ambito_decision: 'producto/servicio', agile_method: "XP"})

# --- [END]42 Prácticas Ágiles ---

# --- Contribuciones ---
Contribucion.delete_all

# Alineación del trabajo...
Contribucion.create!({practica_id: 24, objetivo_id: 11, valor: 5})
Contribucion.create!({practica_id: 18, objetivo_id: 11, valor: 4})
Contribucion.create!({practica_id: 47, objetivo_id: 11, valor: 2})
Contribucion.create!({practica_id: 23, objetivo_id: 11, valor: 2})

# Evitar o reducir...
Contribucion.create!({practica_id: 3, objetivo_id: 1, valor: 3})
Contribucion.create!({practica_id: 41, objetivo_id: 1, valor: 3})
Contribucion.create!({practica_id: 23, objetivo_id: 1, valor: 2})
Contribucion.create!({practica_id: 34, objetivo_id: 1, valor: 2})
Contribucion.create!({practica_id: 40, objetivo_id: 1, valor: 2})

# Reducir defectos en...
Contribucion.create!({practica_id: 10, objetivo_id: 5, valor: 4})
Contribucion.create!({practica_id: 2, objetivo_id: 5, valor: 4})

# Reducir el tiempo de entrega...
Contribucion.create!({practica_id: 1, objetivo_id: 21, valor: 4})
Contribucion.create!({practica_id: 23, objetivo_id: 21, valor: 4})
Contribucion.create!({practica_id: 40, objetivo_id: 21, valor: 4})
Contribucion.create!({practica_id: 34, objetivo_id: 21, valor: 3})
Contribucion.create!({practica_id: 45, objetivo_id: 21, valor: 3})

# Involucar en mayor medida al cliente en la planificación, definición y validación del trabajo 
Contribucion.create!({practica_id: 24, objetivo_id: 12, valor: 5})
Contribucion.create!({practica_id: 9, objetivo_id: 12, valor: 4})
Contribucion.create!({practica_id: 26, objetivo_id: 12, valor: 4})
Contribucion.create!({practica_id: 18, objetivo_id: 12, valor: 4})
Contribucion.create!({practica_id: 25, objetivo_id: 12, valor: 2})

# Tomar decisiones en el momento oportuno
Contribucion.create!({practica_id: 30, objetivo_id: 8, valor: 5})
Contribucion.create!({practica_id: 3, objetivo_id: 8, valor: 4})
Contribucion.create!({practica_id: 28, objetivo_id: 8, valor: 3})
Contribucion.create!({practica_id: 25, objetivo_id: 8, valor: 2})
Contribucion.create!({practica_id: 1, objetivo_id: 8, valor: 2})
Contribucion.create!({practica_id: 45, objetivo_id: 8, valor: 2})

# Mejorar la comunicación dentro del equipo y con el cliente
Contribucion.create!({practica_id: 9, objetivo_id: 10, valor: 4})
Contribucion.create!({practica_id: 5, objetivo_id: 10, valor: 4})
Contribucion.create!({practica_id: 49, objetivo_id: 10, valor: 4})
Contribucion.create!({practica_id: 26, objetivo_id: 10, valor: 3})
Contribucion.create!({practica_id: 45, objetivo_id: 10, valor: 3})
Contribucion.create!({practica_id: 25, objetivo_id: 10, valor: 2})

# Hacer más visible el trabajo del equipo
Contribucion.create!({practica_id: 30, objetivo_id: 7, valor: 5})
Contribucion.create!({practica_id: 8, objetivo_id: 7, valor: 5})
Contribucion.create!({practica_id: 3, objetivo_id: 7, valor: 4})
Contribucion.create!({practica_id: 28, objetivo_id: 7, valor: 4})

# Reducir las horas extras o demanda no prevista de recursos humanos adicionales
Contribucion.create!({practica_id: 32, objetivo_id: 4, valor: 3})
Contribucion.create!({practica_id: 25, objetivo_id: 4, valor: 3})
Contribucion.create!({practica_id: 34, objetivo_id: 4, valor: 3})
Contribucion.create!({practica_id: 11, objetivo_id: 4, valor: 2})

# Gestionar eficazmente el contexto multi-proyecto


# Evitar costos asociados a la realización de tareas prescindibles o dudosamente rentables, 
Contribucion.create!({practica_id: 4, objetivo_id: 14, valor: 4})
Contribucion.create!({practica_id: 14, objetivo_id: 14, valor: 4})
Contribucion.create!({practica_id: 27, objetivo_id: 14, valor: 4})
Contribucion.create!({practica_id: 40, objetivo_id: 14, valor: 4})
Contribucion.create!({practica_id: 7, objetivo_id: 14, valor: 2})

# Reducir el re-trabajo debido a trabajo defectuoso o incompleto detectado por el equipo
Contribucion.create!({practica_id: 2, objetivo_id: 20, valor: 4})
Contribucion.create!({practica_id: 33, objetivo_id: 20, valor: 3})
Contribucion.create!({practica_id: 16, objetivo_id: 20, valor: 2})

# Gestionar eficazmente los cambios, tanto en los trabajos como en sus prioridades, 
Contribucion.create!({practica_id: 8, objetivo_id: 3, valor: 5})
Contribucion.create!({practica_id: 24, objetivo_id: 3, valor: 5})
Contribucion.create!({practica_id: 44, objetivo_id: 3, valor: 4})
Contribucion.create!({practica_id: 1, objetivo_id: 3, valor: 4})
Contribucion.create!({practica_id: 5, objetivo_id: 3, valor: 3})
Contribucion.create!({practica_id: 9, objetivo_id: 3, valor: 3})
Contribucion.create!({practica_id: 25, objetivo_id: 3, valor: 3})
Contribucion.create!({practica_id: 28, objetivo_id: 3, valor: 3})
Contribucion.create!({practica_id: 50, objetivo_id: 3, valor: 2})
Contribucion.create!({practica_id: 45, objetivo_id: 3, valor: 2})

# Promover la mejora continua del proceso empleado por el equipo
Contribucion.create!({practica_id: 14, objetivo_id: 19, valor: 4})
Contribucion.create!({practica_id: 27, objetivo_id: 19, valor: 4})

# Mejorar la gestión de recursos humanos en el equipo
Contribucion.create!({practica_id: 30, objetivo_id: 9, valor: 5})
Contribucion.create!({practica_id: 8, objetivo_id: 9, valor: 5})
Contribucion.create!({practica_id: 43, objetivo_id: 9, valor: 4})
Contribucion.create!({practica_id: 42, objetivo_id: 9, valor: 4})
Contribucion.create!({practica_id: 31, objetivo_id: 9, valor: 4})
Contribucion.create!({practica_id: 6, objetivo_id: 9, valor: 4})
Contribucion.create!({practica_id: 13, objetivo_id: 9, valor: 4})
Contribucion.create!({practica_id: 15, objetivo_id: 9, valor: 4})
Contribucion.create!({practica_id: 45, objetivo_id: 9, valor: 3})
Contribucion.create!({practica_id: 39, objetivo_id: 9, valor: 3})
Contribucion.create!({practica_id: 5, objetivo_id: 9, valor: 3})
Contribucion.create!({practica_id: 12, objetivo_id: 9, valor: 3})
Contribucion.create!({practica_id: 37, objetivo_id: 9, valor: 2})

# Mejorar la sistematización del trabajo
Contribucion.create!({practica_id: 33, objetivo_id: 15, valor: 4})
Contribucion.create!({practica_id: 41, objetivo_id: 15, valor: 3})
Contribucion.create!({practica_id: 17, objetivo_id: 15, valor: 3})
Contribucion.create!({practica_id: 14, objetivo_id: 15, valor: 3})
Contribucion.create!({practica_id: 23, objetivo_id: 15, valor: 2})

# --- [END] Contribuciones ---

# --- Desafíos ---
# Regex: ^(\d+)\s(.*) --> Desafio.create!({id: $1, name: '$2'})

Desafio.delete_all

Desafio.create!({id: 42, name: 'Medir el progreso del trabajo respecto del grado de avance de las funcionalidades, características o servicios que aprovechará el cliente, no por volumen o avance de documentación u otros artefactos que acompañan al producto o servicio'})
Desafio.create!({id: 53, name: 'Definir el trabajo en términos de incrementos en las características que ofrece el producto o servicio que se le ofrece al cliente, no en términos de actividades o artefactos necesarios desde la perspectiva técnica'})
Desafio.create!({id: 10, name: 'Hábito de elaboración y aprovechamiento de la documentación durante el proceso, no solo para acompañar a la entrega'})
Desafio.create!({id: 2, name: 'Experiencia en definición y aplicación de pruebas de aceptación'})
Desafio.create!({id: 5, name: 'Experiencia y hábito de realización de estimaciones (si el producto o servicio lo requiere)'})
Desafio.create!({id: 29, name: 'Disciplina de registro del progreso del trabajo (si el producto o servicio lo requiere)'})
Desafio.create!({id: 38, name: 'Tener la posibilidad de racionalizar la documentación'})
Desafio.create!({id: 50, name: 'Conseguir el apoyo de la dirección para implantar esta práctica'})
Desafio.create!({id: 6, name: 'Posibilidad de añadir, modificar o incluso eliminar total o parcialmente la documentación utilizada en el proceso'})
Desafio.create!({id: 16, name: 'Conseguir reunir en el mismo espacio físico a todos los que intervienen en las actividades necasarias para realizar el trabajo'})
Desafio.create!({id: 22, name: 'Disponer de un espacio acondicionado para el trabajo en equipo'})
Desafio.create!({id: 23, name: 'Conseguir que los integrantes del equipo estén dispuestos a realizar actividades que no sean de su especialidad o preferencia'})
Desafio.create!({id: 24, name: 'Conseguir tener en el equipo integrantes que tengan habilidades para abordar todas las actividades necesarias para terminar un trabajo'})
Desafio.create!({id: 25, name: 'Disciplina de reuniones efectivas, que incluya: tener un moderador, anticipar el propósito e información relevante, etc.'})
Desafio.create!({id: 28, name: 'Transparencia en cuanto a la información asociada al trabajo y a los encargados de realizarlo'})
Desafio.create!({id: 30, name: 'Tener un representante de la parte cliente que ofrezca alta disponibilidad para que el equipo interactúe con él'})
Desafio.create!({id: 41, name: 'Conseguir un único y buen representante de la parte cliente'})
Desafio.create!({id: 31, name: 'Experiencia en automatización de pruebas'})
Desafio.create!({id: 32, name: 'Infraestructura para la ejecución de pruebas automatizadas'})
Desafio.create!({id: 33, name: 'Experiencia, infraestructura y disciplina para integración continua'})
Desafio.create!({id: 34, name: 'Buena actitud de los miembros del equipo para trabajar en conjunto en una misma actividad para determinadas unidades de trabajo'})
Desafio.create!({id: 54, name: 'Contar con un mecanismo de incentivos que valore el desempeño del equipo, no solo el desempeño de cada integrante'})
Desafio.create!({id: 37, name: 'Experiencia y capacidad de los miembros del equipo para tomar decisiones técnicas acertadas'})
Desafio.create!({id: 36, name: 'Proactividad y habilidad de los miembros del equipo para auto-gestionarse individualmente y/o en equipo'})
Desafio.create!({id: 40, name: 'Experiencia en refactorización'})
Desafio.create!({id: 44, name: 'Conseguir que el representante de la parte cliente asuma el liderazgo'})
Desafio.create!({id: 43, name: 'Alinear la planificación con un proceso incremental, en el cual se acuerdan las unidades de trabajo que se entregan en cierto plazo, sin  detallar cómo se organiza el equipo para cumplir dicho plazo'})
Desafio.create!({id: 1, name: 'Conseguir que no se añada trabajo adicional al acordado para un período planificado, excepto por urgencias y/o cambios de prioridades'})
Desafio.create!({id: 46, name: 'Conseguir que representantes de la parte cliente participen en las revisiones de cada entrega'})
Desafio.create!({id: 35, name: 'Que el equipo tenga un líder-facilitador en lugar de un jefe autoritario'})
Desafio.create!({id: 48, name: 'Evitar que los miembros del equipo tengan damasiadas unidades de trabajo asignadas. Privilegiar el terminar unidades de trabajo asignadas en lugar de asignar(se) nuevas'})
Desafio.create!({id: 26, name: 'Evitar las interrupciones a miembros del equipo, en su lugar promover la realización de reuniones programadas, especialmente cuando la interrupción pueda ser de más de 10 minutos (orientativo)'})
Desafio.create!({id: 52, name: 'Desistir de realizar un balanceo de carga de trabajo de los miembros del equipo pues sólo tendrían asignado el trabajo en el cual están trabajando, no se realizarían asignaciones a futuro, salvo en casos excepcionales.'})
Desafio.create!({id: 51, name: 'Que el cliente esté de acuerdo en recibir como entrega lo mínimo que pueda serle útil en un momento determinado'})
Desafio.create!({id: 49, name: 'Si existe un contrato con la parte cliente, que sea flexible en cuando a contenido. Que se puedan añadir, quitar o modificar parte del trabajo acordado, pero manteniendo la consistencia entre el esfuerzo previsto y la capacidad del equipo.'})
Desafio.create!({id: 55, name: 'Contar con una de definición de puestos de trabajo y remuneraciones compatible con la diversidad de actividades que se pretende que puedan llegar a realizar los integrantes del equipo'})
Desafio.create!({id: 47, name: 'Evitar que el equipo esté simultaneamente trabajando en demasiados productos, servicios o proyectos. Priorizar el trabajo de manera que un equipo no se vea obligado a distribuir su capacidad entre contextos de trabajo diferentes'})

# --- [END] Desafíos ---


# --- PracticaDesafio ---

# PracticaDesafio.create!({practica_id: $1 , desafio_id: $2})
# regex: ^(\d+)\s\D*(\d+)

PracticaDesafio.delete_all

PracticaDesafio.create!({practica_id: 1, desafio_id: 42})
PracticaDesafio.create!({practica_id: 1, desafio_id: 53})
PracticaDesafio.create!({practica_id: 2, desafio_id: 10})
PracticaDesafio.create!({practica_id: 2, desafio_id: 2})
PracticaDesafio.create!({practica_id: 3, desafio_id: 5})
PracticaDesafio.create!({practica_id: 3, desafio_id: 29})
PracticaDesafio.create!({practica_id: 3, desafio_id: 42})
PracticaDesafio.create!({practica_id: 4, desafio_id: 38})
PracticaDesafio.create!({practica_id: 4, desafio_id: 50})
PracticaDesafio.create!({practica_id: 4, desafio_id: 6})
PracticaDesafio.create!({practica_id: 4, desafio_id: 10})
PracticaDesafio.create!({practica_id: 5, desafio_id: 16})
PracticaDesafio.create!({practica_id: 5, desafio_id: 22})
PracticaDesafio.create!({practica_id: 5, desafio_id: 50})
PracticaDesafio.create!({practica_id: 6, desafio_id: 23})
PracticaDesafio.create!({practica_id: 6, desafio_id: 24})
PracticaDesafio.create!({practica_id: 7, desafio_id: 25})
PracticaDesafio.create!({practica_id: 8, desafio_id: 28})
PracticaDesafio.create!({practica_id: 9, desafio_id: 30})
PracticaDesafio.create!({practica_id: 9, desafio_id: 41})
PracticaDesafio.create!({practica_id: 10, desafio_id: 31})
PracticaDesafio.create!({practica_id: 10, desafio_id: 32})
PracticaDesafio.create!({practica_id: 11, desafio_id: 33})
PracticaDesafio.create!({practica_id: 12, desafio_id: 34})
PracticaDesafio.create!({practica_id: 12, desafio_id: 54})
PracticaDesafio.create!({practica_id: 13, desafio_id: 37})
PracticaDesafio.create!({practica_id: 13, desafio_id: 36})
PracticaDesafio.create!({practica_id: 13, desafio_id: 28})
PracticaDesafio.create!({practica_id: 13, desafio_id: 25})
PracticaDesafio.create!({practica_id: 13, desafio_id: 22})
PracticaDesafio.create!({practica_id: 13, desafio_id: 16})
PracticaDesafio.create!({practica_id: 14, desafio_id: 50})
PracticaDesafio.create!({practica_id: 15, desafio_id: 23})
PracticaDesafio.create!({practica_id: 15, desafio_id: 34})
PracticaDesafio.create!({practica_id: 16, desafio_id: 40})
PracticaDesafio.create!({practica_id: 18, desafio_id: 41})
PracticaDesafio.create!({practica_id: 18, desafio_id: 44})
PracticaDesafio.create!({practica_id: 23, desafio_id: 43})
PracticaDesafio.create!({practica_id: 23, desafio_id: 42})
PracticaDesafio.create!({practica_id: 24, desafio_id: 41})
PracticaDesafio.create!({practica_id: 24, desafio_id: 30})
PracticaDesafio.create!({practica_id: 25, desafio_id: 30})
PracticaDesafio.create!({practica_id: 25, desafio_id: 1})
PracticaDesafio.create!({practica_id: 25, desafio_id: 42})
PracticaDesafio.create!({practica_id: 25, desafio_id: 43})
PracticaDesafio.create!({practica_id: 26, desafio_id: 46})
PracticaDesafio.create!({practica_id: 27, desafio_id: 28})
PracticaDesafio.create!({practica_id: 27, desafio_id: 36})
PracticaDesafio.create!({practica_id: 28, desafio_id: 36})
PracticaDesafio.create!({practica_id: 28, desafio_id: 35})
PracticaDesafio.create!({practica_id: 28, desafio_id: 28})
PracticaDesafio.create!({practica_id: 28, desafio_id: 16})
PracticaDesafio.create!({practica_id: 30, desafio_id: 28})
PracticaDesafio.create!({practica_id: 31, desafio_id: 48})
PracticaDesafio.create!({practica_id: 32, desafio_id: 1})
PracticaDesafio.create!({practica_id: 34, desafio_id: 1})
PracticaDesafio.create!({practica_id: 34, desafio_id: 5})
PracticaDesafio.create!({practica_id: 34, desafio_id: 50})
PracticaDesafio.create!({practica_id: 35, desafio_id: 26})
PracticaDesafio.create!({practica_id: 37, desafio_id: 35})
PracticaDesafio.create!({practica_id: 37, desafio_id: 36})
PracticaDesafio.create!({practica_id: 37, desafio_id: 50})
PracticaDesafio.create!({practica_id: 37, desafio_id: 37})
PracticaDesafio.create!({practica_id: 39, desafio_id: 52})
PracticaDesafio.create!({practica_id: 40, desafio_id: 51})
PracticaDesafio.create!({practica_id: 41, desafio_id: 49})
PracticaDesafio.create!({practica_id: 41, desafio_id: 43})
PracticaDesafio.create!({practica_id: 41, desafio_id: 1})
PracticaDesafio.create!({practica_id: 42, desafio_id: 23})
PracticaDesafio.create!({practica_id: 42, desafio_id: 55})
PracticaDesafio.create!({practica_id: 43, desafio_id: 47})
PracticaDesafio.create!({practica_id: 44, desafio_id: 50})

# [END] PracticaDesafio

# --- Relaciones Practicas ---

# RelacionPractica.create!({practica_id: $1 , practica2_id: $2})
# regex: ^(\d+)\s\D*(\d+)

RelacionPractica.delete_all

RelacionPractica.create!({practica_id: 1 , practica2_id: 11})
RelacionPractica.create!({practica_id: 1 , practica2_id: 23})
RelacionPractica.create!({practica_id: 1 , practica2_id: 24})
RelacionPractica.create!({practica_id: 1 , practica2_id: 34})
RelacionPractica.create!({practica_id: 1 , practica2_id: 41})
RelacionPractica.create!({practica_id: 2 , practica2_id: 4})
RelacionPractica.create!({practica_id: 2 , practica2_id: 33})
RelacionPractica.create!({practica_id: 2 , practica2_id: 40})
RelacionPractica.create!({practica_id: 3 , practica2_id: 23})
RelacionPractica.create!({practica_id: 5 , practica2_id: 25})
RelacionPractica.create!({practica_id: 5 , practica2_id: 26})
RelacionPractica.create!({practica_id: 5 , practica2_id: 27})
RelacionPractica.create!({practica_id: 5 , practica2_id: 28})
RelacionPractica.create!({practica_id: 7 , practica2_id: 25})
RelacionPractica.create!({practica_id: 7 , practica2_id: 26})
RelacionPractica.create!({practica_id: 7 , practica2_id: 27})
RelacionPractica.create!({practica_id: 7 , practica2_id: 28})
RelacionPractica.create!({practica_id: 8 , practica2_id: 3})
RelacionPractica.create!({practica_id: 8 , practica2_id: 24})
RelacionPractica.create!({practica_id: 8 , practica2_id: 25})
RelacionPractica.create!({practica_id: 8 , practica2_id: 28})
RelacionPractica.create!({practica_id: 8 , practica2_id: 30})
RelacionPractica.create!({practica_id: 8 , practica2_id: 34})
RelacionPractica.create!({practica_id: 8 , practica2_id: 41})
RelacionPractica.create!({practica_id: 9 , practica2_id: 24})
RelacionPractica.create!({practica_id: 9 , practica2_id: 25})
RelacionPractica.create!({practica_id: 9 , practica2_id: 26})
RelacionPractica.create!({practica_id: 10 , practica2_id: 11})
RelacionPractica.create!({practica_id: 14 , practica2_id: 17})
RelacionPractica.create!({practica_id: 14 , practica2_id: 27})
RelacionPractica.create!({practica_id: 14 , practica2_id: 33})
RelacionPractica.create!({practica_id: 17 , practica2_id: 4})
RelacionPractica.create!({practica_id: 18 , practica2_id: 13})
RelacionPractica.create!({practica_id: 18 , practica2_id: 37})
RelacionPractica.create!({practica_id: 24 , practica2_id: 25})
RelacionPractica.create!({practica_id: 24 , practica2_id: 28})
RelacionPractica.create!({practica_id: 24 , practica2_id: 41})
RelacionPractica.create!({practica_id: 25 , practica2_id: 32})
RelacionPractica.create!({practica_id: 27 , practica2_id: 48})
RelacionPractica.create!({practica_id: 28 , practica2_id: 3})
RelacionPractica.create!({practica_id: 30 , practica2_id: 26})
RelacionPractica.create!({practica_id: 30 , practica2_id: 28})
RelacionPractica.create!({practica_id: 30 , practica2_id: 31})
RelacionPractica.create!({practica_id: 30 , practica2_id: 32})
RelacionPractica.create!({practica_id: 30 , practica2_id: 34})
RelacionPractica.create!({practica_id: 30 , practica2_id: 41})
RelacionPractica.create!({practica_id: 30 , practica2_id: 3})
RelacionPractica.create!({practica_id: 30 , practica2_id: 25})
RelacionPractica.create!({practica_id: 30 , practica2_id: 28})
RelacionPractica.create!({practica_id: 31 , practica2_id: 32})
RelacionPractica.create!({practica_id: 31 , practica2_id: 35})
RelacionPractica.create!({practica_id: 31 , practica2_id: 50})
RelacionPractica.create!({practica_id: 33 , practica2_id: 4})
RelacionPractica.create!({practica_id: 33 , practica2_id: 26})
RelacionPractica.create!({practica_id: 34 , practica2_id: 23})
RelacionPractica.create!({practica_id: 34 , practica2_id: 32})
RelacionPractica.create!({practica_id: 34 , practica2_id: 41})
RelacionPractica.create!({practica_id: 37 , practica2_id: 13})
RelacionPractica.create!({practica_id: 41 , practica2_id: 23})
RelacionPractica.create!({practica_id: 43 , practica2_id: 31})
RelacionPractica.create!({practica_id: 43 , practica2_id: 35})
RelacionPractica.create!({practica_id: 45 , practica2_id: 5})
RelacionPractica.create!({practica_id: 45 , practica2_id: 13})
RelacionPractica.create!({practica_id: 45 , practica2_id: 25})
RelacionPractica.create!({practica_id: 45 , practica2_id: 26})
RelacionPractica.create!({practica_id: 45 , practica2_id: 27})
RelacionPractica.create!({practica_id: 45 , practica2_id: 28})
RelacionPractica.create!({practica_id: 49 , practica2_id: 12})


