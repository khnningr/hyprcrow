"""
Universidad Fidélitas
Programación Intermedia (Curso virtual)
Nombre del estudiante: Kendal M. Barrios
Semana 7 - Apertura: domingo, 23 de febrero de 2025, 00:00
           Cierre: martes, 4 de marzo de 2025, 23:59
Integración de Conocimientos 1
"""

"""
Indicaciones:
    Herramienta para gestionar las tareas de sus proyectos:
        * La herramienta debe permitir:
            Asignar, actualizar y consultar tareas.
        * Información relevante:
            Cambiar su estado, listar tareas por prioridad y 
            generar reportes básicos.
    
Requisitos técnicos:
    Tipos de datos y variables: 
        - cadenas, enteros, listas, tuplas y booleanos.
        - Operaciones básicas de entrada y salida:
            Captura de datos del usuario y visualización de información
            en pantalla.
    Operadores básicos:
        - Operadores aritmeticos, comparación y lógicos.
        - Valores booleanos y condicionales; 
            evaluar condiciones mediante acciones.
    Bucles:
        - for y while; iterar entre listas y acceso a información estructurada
        - listas y tuplas: almacenar tareas en listas y acceso a 
            información estructurada.
    Operaciones lógicas:
        - and, or y not; validar condiciones.
    Funciones:
        - Modelar funciones modulares; gestionar las tareas.

Funcionalidad del sistema:
    - Un identificador único.
    - Un nombre o descripción.
    - Un responsable: nombre del miembro del equipo.
    - Una prioridad: Alta, Media o Baja.
    - Un estado: Pendiente, En progreso, Completada.
    - *La información se almacenará en una lista de tuplas.
    - Actualizar estado de una tarea:
        - Permitir cambiar el estado de una tarea específica, es decir,
            de "Pendiente" a "En progreso" o "Completada".
    *Listar tareas:
        - Mostrar todas las tareas gistradas.
        - Mostrar solo tareas con una prioridad específica.
        - Mostrar solo tareas asignadas a un usuario en particular.
        - Generación de reportes:
            - Contar cuántas tareas están completas.
            - Mostrar las tareas de alta prioridad que aún 
                no se han completado.
        - Menú interactivo:
            - Implementar un menú que permita al usuario elegir opciones,
                donde la última opción sea salir.
"""

def solicitud_mensaje(solicitud, confirmar_asignar="N"):
    print(f"\n{solicitud} (s/n)")
    confirmar_asignar = input("> ").upper()       
    if confirmar_asignar == "N":
        return confirmar_asignar
    if confirmar_asignar != "S" and confirmar_asignar != "N":
        print("\nDebes seleccionar (s)í o (n)o.")
        return confirmar_asignar
    return confirmar_asignar

def mostrar_datos(titulo, mostras_contenedor, formulario="",contador=1,salir = "", pregunta=""):
    print(f"\n._-_-_« {titulo.upper()} »_-_-_.\n")
    
    for i in range(len(mostras_contenedor)):
        if formulario and contador >= 1:
            print(str(contador) + ")", formulario[i], mostras_contenedor[i])
            contador += 1
        elif formulario and contador == 0:
            print(formulario[i], mostras_contenedor[i])
        elif contador >= 1:
            print(str(contador) + ")", mostras_contenedor[i])
            contador += 1
        elif contador == 0: # Establecer el contador en 0, cambia el tipo de vista del menu.
            print(mostras_contenedor[i])
            
    if salir:
        print(f"0) {salir}\n")
    if pregunta:
        print(pregunta)
        elegir = int(input("> "))
        return mostras_contenedor[elegir - 1]
        
def mostrar_datos_matriz(titulo, matriz, formulario="",contador=1,salir = "", pregunta=""):
    print(f"\n._-_-_« {titulo.upper()} »_-_-_.\n")
    
    for fila in matriz:
        print(fila[0])
        tarea=fila
        for columna in fila:
            pass    
            
    if salir:
        print(f"0) {salir}\n")
    if pregunta:
        print(pregunta)
        elegir = int(input("> ")) - 1
        if elegir  >= 1 and elegir < len(matriz):
            tarea = matriz[elegir]
            print(tarea)
        else:
            print("no valido")
            

def prioridades_disponibles(prioridad = "- Sin prioridad -"):
    prioridades = ("Alta", "Media", "Baja")
    if "Alta" in prioridad or "Media" in prioridad or "Baja" in prioridad:
        cambiar = solicitud_mensaje("¿Deseas cambiar la prioridad?")
        if cambiar != "S" and cambiar != "N" or cambiar == "N":
            print(prioridad)
            return prioridad      
    prioridad = mostrar_datos("Prioridades", prioridades,pregunta="Seleccione una prioridad:")
    return prioridad

def registrar_tarea(nombre_tarea = "- Sin nombre -",
                    estado = "Pendiente", 
                    prioridad = "- Sin prioridad -", 
                    asignar_usuario = "- Sin usuario -", 
                    descripcion_tarea = "- Sin descripción -",
                    confirmar="N", mostrar_registro="S"):
    while confirmar == "N":  
        print(f"\n._-_-_« {"Registrando tarea".upper()} »_-_-_.\n")
        print("Asigna un nombre a la tarea: ")
        nombre_tarea = input("> ")
        prioridad = prioridades_disponibles()
        print("\nAgrega una descripción a la tarea: ")
        descripcion_tarea = input("> ")
        print(f"\n._-_-_« {"Confirmar asignación".upper()} »_-_-_.\n")
        print(f"Nombre: {nombre_tarea}")
        print(f"Prioridad: {prioridad}")
        print(f"Descripción: {descripcion_tarea}")
        confirmar = solicitud_mensaje("Confirmar asignación:")

    registrar_tarea = [nombre_tarea, estado, prioridad, 
                      asignar_usuario, descripcion_tarea]
    formulario_tarea = ["Nombre: ", "Estado: ", "Prioridad: ",
                   "Responsable: ", "Descripción:" ]
    if mostrar_registro == "S":
        mostrar_datos("Tarea registrada", registrar_tarea, formulario_tarea)
    
    tareas.insert(-1, registrar_tarea)

def consultar_tareas():
    formulario_tarea = ["Nombre: ", "Estado: ", "Prioridad: ",
                   "Responsable: ", "Descripción:" ]
    if tareas:
        mostrar_datos_matriz(titulo="Tareas en general", matriz=tareas, pregunta="Seleccionar una tarea:")
#def asignar_usuario(estado, prioridad):

tareas = []
#registrar_tarea()
registrar_tarea("Lavar platos", 
                prioridad="Media",
                asignar_usuario="Pedro", 
                descripcion_tarea="Es necesario lavar.", 
                confirmar="S", mostrar_registro="N")
registrar_tarea("Comprar ositos", 
                prioridad="Bajo",
                asignar_usuario="Maria", 
                descripcion_tarea="Decorar con ositos.", 
                confirmar="S", mostrar_registro="N")
registrar_tarea("Archivar documentos de Bienes y muebles", 
                prioridad="Media",
                asignar_usuario="Pedro", 
                descripcion_tarea="Hay un atraso con los documentos de bienes y muebles.", 
                confirmar="S", mostrar_registro="N")
consultar_tareas()
#print(tareas)

