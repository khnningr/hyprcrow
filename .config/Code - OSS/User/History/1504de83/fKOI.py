"""
Universidad Fidélitas
Programación Intermedia (Curso virtual)
Nombre del estudiante: Kendal M. Barrios
Semana 7 - Apertura: domingo, 23 de febrero de 2025, 00:00
           Cierre: martes, 4 de marzo de 2025, 23:59
Integración de Conocimientos 1
"""

def establecer_titulo(
    titulo,
    titulo_secundario = ""
    ):
    """
    Está función me permite generar un título entre
    las diversas funciones del programa.
    """
    titulo = titulo.upper()
    titulo_secundario = titulo_secundario.upper()
    if titulo_secundario:
        print("\n._-_-_«", titulo, titulo_secundario, "»_-_-_.\n")
    else:
        print("\n._-_-_«", titulo, "»_-_-_.\n") # El método upper convierte todas las letras a mayúsculas.
    
def solicitud_mensaje(
    mensaje, 
    confirmar_asignar="N"
    ):
    """
    Está función permite generar un mensaje de 
    confirmación en algunas de las funciones 
    mediante un mensaje y un input donde se 
    ingresa un valor de tipo string.
    
    La función confirma entre sus distintos if, 
    si los valores son correctos, los valores 
    correctos admiten solo 'S' y 'N', cualquier 
    otro valor, es rechazado.
    
    Hay que tomar en cuenta que, la función lleva 
    upper, lo cual convierte en mayúscula las letras.
    """
    print("\n" + mensaje, "(s/n)")
    confirmar_asignar = input("> ").upper()       
    if confirmar_asignar == "N":
        return confirmar_asignar
    if confirmar_asignar != "S" and confirmar_asignar != "N": 
        """
        El operador !=, confirma si el valor ingresado 
        es distinto tanto de 'S' como de 'N' mediante un and.
        
        En caso de ser distinto, mostrará un mensaje 
        que lo menciona.
        """
        print("\nDebes seleccionar (s)í o (n)o.")
        return confirmar_asignar
    return confirmar_asignar

def dato_en_arreglo_bidimensional(
    matriz,
    buscar
    ):
    contar = 0
    resultado_buscar = []
    for fila in matriz:
        if buscar in fila:
            resultado_buscar.insert(-1, fila)
            contar += 1
        if "Alta" in fila and "Pendiente" in fila and "alta_pendiente" in buscar:
            resultado_buscar.insert(-1, fila)
            contar += 1
        if "Alta" in  fila and "En progreso" in fila and "alta_en_proceso" in buscar:
            resultado_buscar.insert(-1, fila)
            contar += 1
        if "Alta" in fila and "Alta" in buscar:
            resultado_buscar.insert(-1, fila)
            contar += 1
        if "Media" in fila and "Media" in buscar:
            resultado_buscar.insert(-1, fila)
            contar += 1
        if "Baja" in fila and "Baja" in buscar:
            resultado_buscar.insert(-1, fila)
            contar += 1
        if "Pendiente" in fila and "Pendiente" in buscar:
            resultado_buscar.insert(-1, fila)
            contar += 1
        if "En progreso" in fila and "En progreso" in buscar:
            resultado_buscar.insert(-1, fila)
            contar += 1
        if "Completa" in fila and "Completa" in buscar:
            resultado_buscar.insert(-1, fila)
            contar += 1
    return resultado_buscar, contar
            
def mostrar_conjuto_datos_unidimensional(
    titulo,
    arreglo_unidimensional, 
    titulo_secundario = "",
    formulario = "",
    contador = 1,
    opcion_salida = "", 
    elegir_opcion = "",
    preguntar_accion = ""
    ):
    
    """
    Está función se encarga de mostrar arreglos 
    unidimencionales, entre listas y tuplas.
    
    Algo a tener en cuenta es que, ella, mediante 
    los parametros, valida por condicionales, como 
    mueestra la información, contremplado el valor 
    inicial del contador, por ejemplo, o si existe
    una opción de salida, un formulario, si se debe
    esperar la selección de una opción (un entero).
    """
    
    if titulo_secundario:
        establecer_titulo(
            titulo = titulo, 
            titulo_secundario = titulo_secundario
        )
    else: 
        establecer_titulo(
            titulo = titulo
        )
    
    for i in range(len(arreglo_unidimensional)):
        if formulario and contador >= 1:
            print(str(contador) + ")", formulario[i], arreglo_unidimensional[i])
            contador += 1
        elif formulario and contador == 0:
            print(formulario[i], arreglo_unidimensional[i])
        elif contador >= 1:
            print(str(contador) + ")", arreglo_unidimensional[i])
            contador += 1
        elif contador == 0: # Establecer el contador en 0, cambia el tipo de vista del menu.
            print(arreglo_unidimensional[i])
            
    if opcion_salida:
        print("0)", opcion_salida + "\n")
    if elegir_opcion:
        print(elegir_opcion)
        elegir = int(input("> "))
        if elegir == 0:
            return 0
        if elegir == None:
            print("\nSeleccione una de las opciones disponibles.")
            return 0
        elif elegir  >= 1 and elegir <= len(arreglo_unidimensional):
            return arreglo_unidimensional[elegir - 1], elegir
        else:
            print("\nSeleccione una de las opciones disponibles.")
    if preguntar_accion:
        confirmar = solicitud_mensaje(
            mensaje = preguntar_accion
        )
        return confirmar
        
def mostrar_conjuto_datos_bidimencional(
    titulo,
    arreglo_bidimensional, 
    contador = 1,
    opcion_salida = "", 
    elegir_opcion = ""
    ):
    
    establecer_titulo(
        titulo = titulo
    )
        
    for fila in arreglo_bidimensional:
        if contador >= 1:
            print(str(contador) + ")", fila[0])
            contador += 1
        for columna in fila:
            pass    
            
    if opcion_salida:
        print("0)", opcion_salida, "\n")
    if elegir_opcion:
        print(elegir_opcion)
        elegir = int(input("> "))
        if elegir == 0:
            return 0
        elif elegir  >= 1 and elegir <= len(arreglo_bidimensional):
            tarea = arreglo_bidimensional[elegir - 1]
            return tarea
        else:
            print("\nSeleccione una de las opciones disponibles.")
    
def nombrar(
    tipo_nombre, # Debes ingresar: "tarea" o "usuario".
    nombre = "- Sin nombre -",
    estado = ""
    ):
    
    """
    Está función se encarga de seleccionar 
    un nombre para una tarea o usuario.
    
    Está misma, es capaz de confirmar si 
    ya existe un nombre asignado y 
    devolver un mensaje para saber si se 
    desea cambiar el valor de está.
    """
    
    # Agregar una iteracion de matrices que verifique que el nombre no exista.
    if "Completa" in estado:
        print("\nEstá tarea ha sido completada, no puedes modificar su nombre.")
        return nombre
    if not "- Sin nombre -" in nombre:
        if "tarea" in tipo_nombre:
            cambiar = solicitud_mensaje(
                mensaje = "¿Deseas cambiar el nombre de la tarea?"
            )
        if "usuario" in tipo_nombre:
            cambiar = solicitud_mensaje(
                mensaje = "¿Deseas cambiar el nombre de usuario?"
            )
        if cambiar != "S" and cambiar != "N" or cambiar == "N":
            print("\nNombre no cambiado.")
            return nombre
    nombre_anterior = nombre
    if "tarea" in tipo_nombre:      
        print("\nAsigna un nombre a la tarea: ")
    if "usuario" in tipo_nombre:
        print("\nAsigna un nombre al usuario: ")
    nombre = input("> ")
    if "tarea" in tipo_nombre and not "- Sin nombre -" in nombre_anterior:
        print("\nNuevo nombre de la tarea establecido, de", 
              "'" + nombre_anterior + "'", "a", "'" + nombre + "'" + ".")
    if "usuario" in tipo_nombre and not "- Sin nombre -" in nombre_anterior:
        print("\nNuevo nombre de la tarea establecido, de", 
              "'" + nombre_anterior + "'", "a", "'" + nombre + "'" + ".")
    return nombre 
    
def estados_disponibles(
    estado = "Pendiente"
    ):
    
    """
    Está función se encarga de seleccionar 
    un estado de una tarea en concreto.
    
    Está misma, es capaz de confirmar si 
    ya existe una prioridad asignada y 
    devolver un mensaje para saber si se 
    desea cambiar el valor de está.
    """
    #Un estado: Pendiente, En progreso, Completada.
    estados = (
        "Pendiente", 
        "En progreso", 
        "Completa"
    )
    estado_anterior = estado
    if "Completa" in estado:
        print("\nEstá tarea ha sido completada, no puedes modificar su estado.")
        return estados[2]
    if "En progreso" in estado or "Pendiente" in estado:
        cambiar = solicitud_mensaje(
            mensaje = "¿Deseas cambiar el estado de la tarea?"
        )
        if cambiar != "S" and cambiar != "N" or cambiar == "N":
            print(estado)
            return estado      
    estado = mostrar_conjuto_datos_unidimensional(
        titulo = "Estado", 
        arreglo_unidimensional = estados,
        elegir_opcion = "Seleccione un estado:"
    )[0]
    if estado == 0:
        print("\nSeleccione un estado.")
        return estados_disponibles()
    print("\nNuevo estado establecido de", 
          "'" + estado_anterior + "'", "a", "'" + estado+ "'" + ".")
    return estado  

def prioridades_disponibles(
    estado = "",
    prioridad = "- Sin prioridad -"
    ):
    
    """
    Está función se encarga de seleccionar 
    una prioridad de una tarea en concreto.
    
    Está misma, es capaz de confirmar si 
    ya existe una prioridad asignada y 
    devolver un mensaje para saber si se 
    desea cambiar el valor de está.
    """
    
    prioridades = (
        "Alta", 
        "Media", 
        "Baja"
    )
    prioridad_anterior = prioridad
    if "Completa" in estado:
        print("\nEstá tarea ha sido completada, no puedes modificar su prioridad.")
        return prioridad
    if "Alta" in prioridad or "Media" in prioridad or "Baja" in prioridad:
        cambiar = solicitud_mensaje(
            mensaje = "¿Deseas cambiar la prioridad?"
        )
        if cambiar != "S" and cambiar != "N" or cambiar == "N":
            return prioridad      
    prioridad = mostrar_conjuto_datos_unidimensional(
        titulo = "Prioridades", 
        arreglo_unidimensional = prioridades,
        elegir_opcion = "Seleccione una prioridad:"
    )[0]
    if prioridad == 0 and prioridad == None:
        print("\nSelecciona una prioridad.")
        return prioridades_disponibles()
    if not "- Sin prioridad -" in prioridad_anterior:
        print("\nNuevo prioridad de la tarea establecida, de", 
              "'" + prioridad_anterior + "'", "a", "'" + prioridad + "'" + ".")
    return prioridad

def descripcion(
    descripcion = "- Sin descripción -",
    estado = ""
    ):
    descripcion_anterior = descripcion
    if "Completa" in estado:
        print("\nEstá tarea ha sido completada, no puedes modificar su descripción.")
        return descripcion
    if not "- Sin descripción -" in descripcion:
        cambiar = solicitud_mensaje(
            mensaje = "¿Deseas cambiar la descripción de la tarea?"
        )
        if cambiar != "S" and cambiar != "N" or cambiar == "N":
            print("\nNombre no cambiado.")
            return descripcion
    print("\nAgrega una descripción a la tarea: ")
    descripcion = input("> ")
    if not "- Sin descripción -" in descripcion_anterior:
        print("\nNueva descripción establecida de:\n\n", 
            "'" + descripcion_anterior + "'", "\n\t↓\n", "'" + descripcion+ "'\n")
    return descripcion 

def id_usuario(
    usuario,
    pseudo_id_usuario
    ):
    
    
    
    import random
    
    pseudo_id_usuario = random.randrange(100_000, 600_000, 1)
           
    print("\nSe ha asignado", pseudo_id_usuario, "como ID al usuario", usuario)
    print(type(pseudo_id_usuario))
    return int(pseudo_id_usuario)
    
# Registrar usuario
def registrar_usuario(
    asignar_id_usuario = 0,
    nombre_usuario = "- Sin nombre -",
    confirmar_usuario = "N",
    mostrar_registro = "S"
):
    
    while confirmar_usuario == "N":
        establecer_titulo(
            titulo = "Registrando usuario"
        )
        nombre_usuario = nombrar(
            tipo_nombre = "usuario",
            nombre = nombre_usuario
        )
        asignar_id_usuario = id_usuario(
            usuario = nombre_usuario,
            pseudo_id_usuario = asignar_id_usuario
        )
        establecer_titulo(
            titulo = "Confirmar asignación"
        )
        print(f"Nombre:", nombre_usuario)
        print(f"ID:", asignar_id_usuario)
        confirmar_usuario = solicitud_mensaje(
            mensaje = "Confirmar asignación:"
        )
    
    registrar_usuario = [
        nombre_usuario,
        asignar_id_usuario
    ]
    
    formulario_usuario = [
        "Nombre: ", 
        "ID: "
    ]
    
    if mostrar_registro == "S":
        mostrar_conjuto_datos_unidimensional(
            titulo = "Usuario registrado", 
            arreglo_unidimensional = registrar_usuario, 
            formulario = formulario_usuario,
            contador = 0
        )
    
    usuarios.insert(-1, registrar_usuario)
    
# Asiganar miembros
def asignar_usuario(
    origen, # Indica desde donde se hace el llamado: Desde una tarea o si se asigan desde el menu principal; tarea o usuario.
    tareas,
    usuarios,
    usuario_actual = "- Sin usuario -",
    estado = "" 
):
    usuario_anterior = usuario_actual
    if not tareas:
        print("\nAún no existen tareas registradas.")
        return 0
    if not usuarios:
        print("\nAún no existen usuarios registrados.")
        return 0
    if "Completa" in estado:
        print("\nEstá tarea ha sido completada, no puedes modificar su responsable.")
        return usuario_actual
    if not "- Sin usuario -" in usuario_actual:
        cambiar = solicitud_mensaje(
            mensaje = "¿Deseas asignar otro usuario?"
        )
        if cambiar != "S" and cambiar != "N" or cambiar == "N":
            print("\nNo se ha modificado el usuario.")
            return usuario_actual 
        
    usuario = mostrar_conjuto_datos_bidimencional(
        titulo = "Usuarios disponibles", 
        arreglo_bidimensional = usuarios,
        opcion_salida = "Volver",
        elegir_opcion = "Seleccione un usuario:"
    )
    
    if usuario == None:
        return 0
    
    if "tarea" in origen:
        usuario[0]
    if "usuario" in origen:
        tarea = mostrar_conjuto_datos_bidimencional(
                titulo = "Tareas disponibles", 
                arreglo_bidimensional = tareas,
                opcion_salida = "cancelar",
                elegir_opcion = "Seleccione una tarea:"
            )
        usuario_anterior = tarea[3]
        if not "- Sin usuario -" in tarea[3]:
            cambiar = solicitud_mensaje(
                mensaje = "¿Deseas asignar este usuario?"
            )
            if cambiar != "S" and cambiar != "N" or cambiar == "N":
                print("\nNo se ha modificado el usuario.")
                return
        if tarea == None:
            return 0
        if tarea == 0:
            return 0
        tarea[3] = usuario[0]
    if usuario_anterior in usuario[0]:
        print("\nEl usuario ya se encuentra asignado a está tarea.")
        return usuario_anterior
    if not "- Sin usuario -" in usuario_anterior or not "- Sin usuario -" in tarea[3]:
        print("\nNuevo usuario asignado de la tarea establecida, de", 
                "'" + usuario_anterior + "'", "a", "'" + usuario[0] + "'" + ".")

def registrar_tarea(
    nombre_tarea = "- Sin nombre -",
    estado = "Pendiente", 
    prioridad = "- Sin prioridad -", 
    asignar_usuario = "- Sin usuario -", 
    descripcion_tarea = "- Sin descripción -",
    confirmar_formulario = "N", 
    mostrar_registro = "S"
    ):
    
    while confirmar_formulario == "N":
        establecer_titulo(
            titulo = "Registrando tarea"
        )  
        nombre_tarea = nombrar(
            tipo_nombre = "tarea", 
            nombre = nombre_tarea
        )
        prioridad = prioridades_disponibles()
        descripcion_tarea = descripcion(
            descripcion = descripcion_tarea
            )
        establecer_titulo(
            titulo = "Confirmar asignación"
        )
        print(f"Nombre: {nombre_tarea}")
        print(f"Prioridad: {prioridad}")
        print(f"Descripción: {descripcion_tarea}")
        confirmar_formulario = solicitud_mensaje(
            mensaje = "Confirmar asignación:"
        )

    registrar_tarea = [
        nombre_tarea,
        estado,
        prioridad, 
        asignar_usuario,
        descripcion_tarea
    ]
    
    formulario_tarea = [
        "Nombre: ", 
        "Estado: ", 
        "Prioridad: ",
        "Responsable: ", 
        "Descripción:" 
    ]
    
    if mostrar_registro == "S":
        mostrar_conjuto_datos_unidimensional(
            titulo = "Tarea registrada", 
            arreglo_unidimensional = registrar_tarea, 
            formulario = formulario_tarea,
            contador = 0
        )
    
    tareas.insert(-1, registrar_tarea)

def eliminar(
    matriz,
    eliminar, # Debes ingresar: "usuario", "tarea".
):
    if not tareas and matriz == tareas:
        return print("\nAún no existen tareas registradas.")
    if not usuarios and matriz == usuarios:
        return print("\nAún no existen usuarios registrados.")
    
    formulario_tarea = [
        "Nombre: ", 
        "Estado: ", 
        "Prioridad: ",
        "Responsable: ",
        "Descripción:" 
    ]
    
    formulario_usuario = [
        "Nombre: ", 
        "ID: "
    ]
    
    if "tarea" in eliminar:
        titulo_disponibles = "Eliminar tarea disponible"
        elegir_disponibles = "Seleccione una tarea:"
        titulo_consulta = "Tarea:"
        formulario = formulario_tarea
        mensaje = "¿Deseas eliminar la tarea?"
    if "usuario" in eliminar:
        titulo_disponibles = "Eliminar usuario disponible"
        elegir_disponibles = "Seleccione un usuario:"
        titulo_consulta = "Usuario:"
        formulario = formulario_usuario
        mensaje = "¿Deseas eliminar el usuario?"
        
    elegir = mostrar_conjuto_datos_bidimencional(
        titulo = titulo_disponibles, 
        arreglo_bidimensional = matriz,
        opcion_salida = "Volver",
        elegir_opcion = elegir_disponibles
    )
    if elegir == 0 or elegir == None:
        return 0
    
    eliminar = mostrar_conjuto_datos_unidimensional(
            titulo = titulo_consulta,
            titulo_secundario = elegir[0],
            arreglo_unidimensional = elegir,
            formulario = formulario,
            contador = 0,
    )
    if "Completa" in elegir:
        return print("\nNo puedes eliminar una tarea ya completada.")
    confirmar = solicitud_mensaje(
            mensaje = mensaje
    )
    if confirmar != "S" and confirmar != "N" or confirmar == "N":
        return
    print("\nSe ha eliminado", "'" + titulo_consulta, elegir[0] + "'", "del registro.")
    matriz.remove(elegir)

def consultar_informacion(
    matriz,
    tipo_consulta, # Debes ingresar: "seleccionar", "mostrar", "asignar".
    tipo_formulario, # Debe ingresar: "tarea" o "usuario"
):
    
    if not tareas and matriz == tareas:
        return print("\nAún no existen tareas registradas.")
    if not usuarios and matriz == usuarios:
        return print("\nAún no existen usuarios registrados.")
    
    formulario_tarea = [
        "Nombre: ", 
        "Estado: ", 
        "Prioridad: ",
        "Responsable: ",
        "Descripción:" 
    ]
    
    formulario_usuario = [
        "Nombre: ", 
        "ID: "
    ]
    
    if "tarea" in tipo_formulario:
        titulo_disponibles = "Tareas disponibles"
        elegir_disponibles = "Seleccione una tarea:"
        titulo_consulta = "Tarea:"
        formulario = formulario_tarea
    if "usuario" in tipo_formulario:
        titulo_disponibles = "Usuarios disponibles"
        elegir_disponibles = "Seleccione un usuario:"
        titulo_consulta = "Usuario:"
        formulario = formulario_usuario
    
    elegir = mostrar_conjuto_datos_bidimencional(
        titulo = titulo_disponibles, 
        arreglo_bidimensional = matriz,
        opcion_salida = "Volver",
        elegir_opcion = elegir_disponibles
    )
    
    if elegir == 0:
        return 0
    
    if elegir == None:
        return 0
    
    if tipo_consulta == "mostrar":
        mostrar = mostrar_conjuto_datos_unidimensional(
            titulo = titulo_consulta,
            titulo_secundario = elegir[0],
            arreglo_unidimensional = elegir,
            formulario = formulario,
            contador = 0,
            elegir_opcion = "\nPara volver, presiona (0):"
        )
        if mostrar != 0:
            print("\nEste menu solo muestra información de", 
                  "'" + titulo_consulta, elegir[0] + "'" + ".")
        if mostrar == 0:
            print("\nVoliendo al menú anterior.")
            
        
    if tipo_consulta == "seleccionar":
        dato = mostrar_conjuto_datos_unidimensional(
            titulo = titulo_consulta,
            titulo_secundario = elegir[0],
            arreglo_unidimensional = elegir,
            formulario = formulario,
            opcion_salida = "Cancelar",
            elegir_opcion = "Seleccione un dato:"
        )
        
        if dato == 0:
            return print("\nVolviendo al menu anterior.")
        return elegir, dato
    
def modificar_tarea():
    while True:
        dato = consultar_informacion(
            matriz = tareas,
            tipo_consulta = "seleccionar",
            tipo_formulario = "tarea"
        )

        if dato == None:
           return modificar_tarea() 
        if dato == 0:
            break
        
        elif dato[1][1] == 1:
            dato[0][0] = nombrar(
                tipo_nombre = "tarea", 
                nombre = dato[0][0],
                estado = dato[0][1],
            )
        elif dato[1][1] == 2:
            dato[0][1] = estados_disponibles(
                estado = dato[0][1]
            )
        elif dato[1][1] == 3:
            dato[0][2] = prioridades_disponibles(
                estado = dato[0][1],
                prioridad = dato[0][2]
            )
        elif dato[1][1] == 4:
            dato[0][3] = asignar_usuario(
                origen = "tarea", 
                tareas = tareas, 
                usuarios = usuarios,
                usuario_actual = dato[0][3],
                estado = dato[0][1]
            )
        elif dato[1][1] == 5:
            dato[0][4] = descripcion(
                descripcion = dato[0][4],
                estado = dato[0][1]
            )

def usuarios_de_inicio():
    registrar_usuario(
        asignar_id_usuario = 111_111,
        nombre_usuario = "Pedro",
        confirmar_usuario = "S",
        mostrar_registro = "N"
    )
    registrar_usuario(
        asignar_id_usuario = 222_222,
        nombre_usuario = "Maria",
        confirmar_usuario = "S",
        mostrar_registro = "N"
    )
    registrar_usuario(
        asignar_id_usuario = 333_333,
        nombre_usuario = "Kendal",
        confirmar_usuario = "S",
        mostrar_registro = "N"
    )
    registrar_usuario(
        asignar_id_usuario = 555_555,
        nombre_usuario = "Martín",
        confirmar_usuario = "S",
        mostrar_registro = "N"
    )
    
def tareas_de_inicio():
    """
    Está función crea tareas por defecto con sus,
    respectivas asiganaciones, con la función de 
    resgistrar_tarea sin llenar un formulario o
    mostrar la información, se crean apenas se 
    ejecuta el programa sin que el usuario las vea.
    """
    registrar_tarea(
        nombre_tarea = "Cena con ejecutivos", 
        estado = "Completa",
        prioridad = "Media",
        asignar_usuario = "Pedro", 
        descripcion_tarea = "Presentarse en la cena con ejecutivos.", 
        confirmar_formulario = "S", 
        mostrar_registro = "N"
    )
    registrar_tarea(
        nombre_tarea = "Pulido del pasillo",
        estado = "Completa", 
        prioridad = "Baja",
        asignar_usuario = "Maria", 
        descripcion_tarea = "Se debe hacer trabajos de mantenimiento\n\t     en el piso del pasillo.", 
        confirmar_formulario = "S", 
        mostrar_registro = "N"
    )
    registrar_tarea(
        nombre_tarea = "Archivar documentos de Bienes y muebles", 
        prioridad = "Baja",
        asignar_usuario = "Pedro",
        descripcion_tarea = "Hay un atraso con los documentos de bienes\n\t     y muebles.", 
        confirmar_formulario = "S", 
        mostrar_registro = "N"
    )
    registrar_tarea(
        nombre_tarea = "Confirmar ordenes", 
        prioridad = "Alta",
        asignar_usuario = "Maria",
        descripcion_tarea = "Confirmar las ordenes de este mes.", 
        confirmar_formulario = "S", 
        mostrar_registro = "N"
    )
    registrar_tarea(
        nombre_tarea = "Guantes de seguridad", 
        estado = "En progreso",
        prioridad = "Alta",
        asignar_usuario = "Kendal",
        descripcion_tarea = "Hay nuevos entrenamientos en el área de carga,\n\t     es necesario comprar nuevos guantes de seguridad.", 
        confirmar_formulario = "S", 
        mostrar_registro = "N"
    )
    registrar_tarea(
        nombre_tarea = "Realizar rotación de este mes", 
        prioridad = "Alta",
        asignar_usuario = "Maria",
        descripcion_tarea = "Actualizar rotación actual.", 
        confirmar_formulario = "S", 
        mostrar_registro = "N"
    )
    registrar_tarea(
        nombre_tarea = "Solicitar zapatos de seguridad", 
        estado = "En progreso",
        prioridad = "Alta",
        asignar_usuario = "Kendal",
        descripcion_tarea = "Hay nuevos entrenamientos en el área de carga,\n\t     es necesario comprar nuevos zapatos de seguridad.", 
        confirmar_formulario = "S", 
        mostrar_registro = "N"
    )

def consultar_tareas():
    while True:
        tarea = consultar_informacion(
            matriz = tareas,
            tipo_consulta = "mostrar",
            tipo_formulario = "tarea"
        )
        if tarea == 0:
            print("\nVolviendo al menu principal.")
            break

def consultar_usuarios():
    while True:
        usuario = consultar_informacion(
            matriz = usuarios,
            tipo_consulta = "mostrar",
            tipo_formulario = "usuario"
        )
        if usuario == 0:
            break

def ordenar_tareas_estado(): # Usar como ejemplo para desarrollar salidas y seudobicles.
    
    estados = (
        "Pendiente", 
        "En progreso", 
        "Completa"
    )
     
    estado = mostrar_conjuto_datos_unidimensional(
        titulo = "Ordenar tareas por estado", 
        arreglo_unidimensional = estados,
        opcion_salida = "Volver",
        elegir_opcion = "Seleccione un estado:"
    )
    
    if estado == None:
        print("\nSeleccione un estado.")
        return ordenar_tareas_estado()
    
    if estado == 0:
        return print("\nVolviendo al menu principal.")

    buscar_estado = dato_en_arreglo_bidimensional(
        matriz = tareas, 
        buscar = estado
    )
    
    if not buscar_estado[0]:
        print("\n\t→ No hay ninguna tarea con estado",
              "'" + estado[0] + "'", "en este momento.")
        return ordenar_tareas_estado()
    establecer_titulo(
        titulo = "Aviso"
    )
    if buscar_estado[1] == 1:
        print("\t→ Hay", buscar_estado[1], "tarea con estado", 
              "'" + estado[0] + "'", "en este momento.")
    if buscar_estado[1] > 1:
        print("\t→ Hay", buscar_estado[1], "tareas con estado", 
              "'" + estado[0] + "'", "en este momento.")
    
    tarea = consultar_informacion(
        matriz = buscar_estado[0],
        tipo_consulta = "mostrar",
        tipo_formulario = "tarea",
    )
    if tarea == None or tarea == 0:
        print("\nVolviendo al menu anterior.")
        ordenar_tareas_estado()

def ordenar_tareas_prioridad(): # Usar como ejemplo para desarrollar salidas y seudobicles.
    
    prioridades = (
        "Alta", 
        "Media", 
        "Baja"
    )
      
    prioridad = mostrar_conjuto_datos_unidimensional(
        titulo = "Ordenar tareas por prioridad", 
        arreglo_unidimensional = prioridades,
        opcion_salida = "Volver",
        elegir_opcion = "Seleccione una prioridad:"
    )
        
    if prioridad == None:
        print("\nSeleccione una prioridad.")
        return ordenar_tareas_prioridad()
    
    if prioridad == 0:
        return print("\nVolviendo al menu principal.")

    buscar_prioridad = dato_en_arreglo_bidimensional(
        matriz = tareas, 
        buscar = prioridad
    )
    
    if not buscar_prioridad[0]:
        print("\n\t→ No hay ninguna tarea con prioridad", 
              "'" + prioridad[0] + "'", "en este momento.")
        return ordenar_tareas_prioridad()
    establecer_titulo(
        titulo = "Aviso"
    )
    if buscar_prioridad[1] == 1:
        print("\t→ Hay", buscar_prioridad[1], "tarea con prioridad", 
              "'" + prioridad[0] + "'", "en este momento.")
    if buscar_prioridad[1] > 1:
        print("\t→ Hay", buscar_prioridad[1], "tareas con prioridad", 
              "'" + prioridad[0] + "'", "en este momento.")
    
    tarea = consultar_informacion(
        matriz = buscar_prioridad[0],
        tipo_consulta = "mostrar",
        tipo_formulario = "tarea",
    )
    if tarea == None or tarea == 0:
        print("\nVolviendo al menu anterior.")
        return ordenar_tareas_prioridad()

def ordenar_tareas_usuario():
    
    usuario = mostrar_conjuto_datos_bidimencional(
        titulo = "Ordenar tareas por usuario",
        arreglo_bidimensional = usuarios,
        opcion_salida = "Volver",
        elegir_opcion = "Seleccione un usuario:"
    )
    
    if usuario == None:
        print("\nSeleccione un usuario.")
        return ordenar_tareas_usuario()
    if usuario == 0:
        return print("\nVolviendo al menu principal.")
    
    buscar_usuario = dato_en_arreglo_bidimensional(
        matriz = tareas,
        buscar = usuario[0]
    )
    
    if not buscar_usuario[0]:
        print("\n\t→ No hay ninguna tarea asociada con",
              "'" + usuario[0] + "'", "como responsable en este momento.")
        return ordenar_tareas_usuario()
    establecer_titulo(
        titulo = "Aviso"
    )

    if buscar_usuario[1] == 1:
        print("\t→ Hay", buscar_usuario[1], "tarea asociada con", 
              "'" + usuario[0] + "'", "como responsable en este momento.")
    if buscar_usuario[1] > 1:
        print("\t→ Hay", buscar_usuario[1], "tarea asociada con", 
              "'" + usuario[0] + "'", "como responsable en este momento.")
    tarea = consultar_informacion(
        matriz = buscar_usuario[0],
        tipo_consulta = "mostrar",
        tipo_formulario = "tarea",
    )

    if tarea == None or tarea == 0:
        print("\nVolviendo al menu anterior.")
        return ordenar_tareas_usuario()

def tareas_completas(
    completas,
    ver = "N"
):
    buscar_completa = dato_en_arreglo_bidimensional(
        matriz = tareas, 
        buscar = "Completa"
    )
    if not buscar_completa[0]:
        print("\n\t→ No hay ninguna tarea con estado", 
              "'" + "Completa" + "'", "en este momento.")
    if buscar_completa[1] == 1:
        print("\n\t→ Hay", buscar_completa[1], "tarea con estado", 
              "'" + "Completa" + "'", "en este momento.")
    if buscar_completa[1] > 1:
        print("\n\t→ Hay", buscar_completa[1], "tareas con estado", 
              "'" + "Completa" + "'", "en este momento.")
    if "N" in ver: 
        print("\t→ Nota: Las tareas completas se han guardado en una tupla.")
    if "S" in ver:
        tarea = consultar_informacion(
            matriz = buscar_completa[0],
            tipo_consulta = "mostrar",
            tipo_formulario = "tarea",
        )
        if tarea == None:
            tareas_completas(
               completas = completas, 
                ver = "S" 
            )
        if tarea == 0:
            return print("\nVolviendo al menu principal.")
    completas = tuple(buscar_completa[0])
    
def tareas_importantes(
    tareas
):
    pendiente_importantes = dato_en_arreglo_bidimensional(
        matriz = tareas, 
        buscar = "alta_pendiente"
    )
    en_proceso_importantes = dato_en_arreglo_bidimensional(
        matriz = tareas, 
        buscar = "alta_en_proceso"
    )

    if not pendiente_importantes[0] and not en_proceso_importantes[0]:
        print("\t→ No hay ninguna tarea a la cual debas prestar atención en este momento.")
    if pendiente_importantes[1] == 1:
        print("\t→ Hay", pendiente_importantes[1], "tarea con estado", 
              "'" + "Pendiente" + "'", "y prioridad 'Alta' en este momento.")
    if pendiente_importantes[1] > 1:
        print("\t→ Hay", pendiente_importantes[1], "tareas con estado", 
              "'" + "Pendiente" + "'", "y prioridad 'Alta' en este momento.")
    if en_proceso_importantes[1] == 1:
        print("\t→ Hay", en_proceso_importantes[1], "tarea con estado", 
              "'" + "En progreso" + "'", "y prioridad 'Alta' en este momento.")
    if en_proceso_importantes[1] > 1:
        print("\t→ Hay", en_proceso_importantes[1], "tareas con estado", 
              "'" + "En progreso" + "'", "y prioridad 'Alta' en este momento.")
    
def menu_principal():
    
    opciones_menu = (
        "Registrar tarea",
        "Registrar usuario",
        "Asignar usuario",
        "Consultar tareas",
        "Tareas completadas",
        "Eliminar tarea",
        "Modificar tarea",
        "Consultar usuarios",
        "Eliminar usuario",
        "Ordenar por usuario",
        "Ordenar por prioridad",
        "Ordenar por estado",
    )
    
    while True:
        establecer_titulo(
            titulo = "Avisos"
        )
        
        tareas_importantes(
            tareas = tareas,
        )
        
        tareas_completas(
            completas = completas, 
            ver = "N"
        )
        
        elegir = mostrar_conjuto_datos_unidimensional(
            titulo = "Menú principal", 
            arreglo_unidimensional = opciones_menu,
            opcion_salida = "Salir",
            elegir_opcion = "Seleccione una opción:"
        )
        if elegir == None:
            return menu_principal()
        if elegir == 0:
            salir = solicitud_mensaje(
                mensaje = "¿Deseas salir del programa?"
            )
            if salir != "S" and salir != "N" or salir == "N":
                return menu_principal()
            return print("\nHaz salido del programa.")
        elif elegir[1] == 1:
            registrar_tarea()
        elif elegir[1] == 2:
            registrar_usuario()
        elif elegir[1] == 3:
            asignar_usuario(
                origen = "usuario",
                tareas = tareas,
                usuarios = usuarios
            )
        elif elegir[1] == 4:
            consultar_tareas()
        elif elegir[1] == 5:
            tareas_completas(
                completas = completas, 
                ver = "S"
            )
        elif elegir[1] == 6: # Eliminar tarea
            eliminar(
                matriz = tareas,
                eliminar = "tarea"
            )
        elif elegir[1] == 7:
            modificar_tarea()
        elif elegir[1] == 8:
            consultar_usuarios()
        elif elegir[1] == 9:
            eliminar(
                matriz = usuarios,
                eliminar = "usuario"
            )
        elif elegir[1] == 10:
            ordenar_tareas_usuario()
        elif elegir[1] == 11:
            ordenar_tareas_prioridad()
        elif elegir[1] == 12:
            ordenar_tareas_estado()
        else:
            return menu_principal()
    
    # Agregar aviso encima del titulo, sobre tareas de Alta prioridad; que esten pendientes o en proceso.
    # Importante (Titulo): Hay conteo_de_tareas tareas Pendientes o En proceso de Alta prioridad.
    
tareas = []
usuarios = []
completas = ()

tareas_de_inicio()
usuarios_de_inicio()

menu_principal()