from tarea import Tarea

class GestorTareas():

    """
    Está función me permite generar un títulos.
    """
    def generar_titulo(
        self,
        titulo_principal,
        titulo_secundario = ""
        ):
        # El método upper convierte todas las letras a mayúsculas.
        titulo_principal = titulo_principal.upper()
        titulo_secundario = titulo_secundario.upper()
        #
        if titulo_secundario:
            print("\n._-_-_«", titulo_principal, titulo_secundario, "»_-_-_.\n")
        else:
            print("\n._-_-_«", titulo_principal, "»_-_-_.\n")

    """
    Este método me permite lanzar un
    mensaje de confirmación al usuario.
    """
    def confirmar_accion(
        self,
        peticion # Introduce una str con el mensanje que se desea mostrar.
        ):
        
        try:
            print("\n¿" + peticion + " (S/N)?")
            elegir = input("> ").upper()
        except KeyboardInterrupt:
            print("\nHaz cancelado la confirmación.")
            return False

        if (not elegir == "S" and
        not elegir == "N"):
            print("\nDebes confirmar con S/N.")
            return self.confirmar_accion(peticion)

        if "N" in elegir:
            return False
        
        return True
    
    """
    Esté método me muestra los cambios,
    o asignaciones a los atributos.
    """
    def mensaje_confirmacion(
        self, tipo_atributo, # Parametro que pasa el tipo de atributo por escrito, es decir, str.
        nuevo_atributo, # Este parámetro recibe un str con el nuevo valor del atributo.
        anterior_atributo = "", # Este parametro recibe el atributo anterior, si lo hay; está inicializado, en caso de que exista.
        ):
        # Condicional que verifica el contexto del atributo, para retornar el mensaje coerentemente con el atributo.
        if "Prioridad" in tipo_atributo:
            palabra_1 = "Nueva "
            palabra_2 = " establecida "
        else: 
            palabra_1 = "Nuevo "
            palabra_2 = " establecido "
        # Condicional que verifica si nos referimos a la descripción de la tarea, ya que difiere el mensaje en caso de serlo.
        if not "Descripción" in tipo_atributo:
            # Condicional que verifica si existe ya una asignación del atributo, para cambiarlo o en caso contrario, asiganarlo.
            if not "Sin" in anterior_atributo:
                # Retorna el mensaje mostrando el cambiado hecho en el atributo de la tarea.
                return("\n» " + palabra_1 + "*" + tipo_atributo.upper() + "*"
                + palabra_2 + "a la tarea. De '" + anterior_atributo + "'" 
                + " a " + "'" + nuevo_atributo + "' «")
            else:
                # Retorna el mensaje mostrando la asignación del atributo de la tarea.
                return("\n» Se ha asignado " + "'" + nuevo_atributo + "'" 
                + " como " + "*" + tipo_atributo.upper() +"*" + " a la tarea «\n")
        else:
            # Similar al condicional anterior, verifica la existencia de una descripción, ya sea para cambiarla, o asignar una.
            if not "Sin" in anterior_atributo:
                # Retorna el mensaje mostrando el cambiado hecho en la descripción de la tarea.
                return("\n» Nueva *DESCRIPCIÓN* establecida «\n" 
                    + "\n» Descripción anterior: '" + anterior_atributo + "' «\n" 
                    + "\n» Nueva descripción: '" + nuevo_atributo + "' «\n")
            else:
                # Retorna el mensaje mostrando la asignación del atributo de la tarea.
                return("\n» Se ha asignado una *DESCRIPCIÓN* a la tarea «\n"
                    + "\n» Descripción: '" + nuevo_atributo + "' «\n")

    """
    """
    def generar_indice(
        self, 
        lista, # Parametro que pasa el arreglo unidimencional
        indice = 0, # Por defecto, no imprime un indice enumerado, si se cambia a 1 o más, lo va a generar (usar 1).
        ):
        # Bucle for que itera entre los datos de una tupla o lista unidimencional.
        for i in range(len(lista)):
            # Condición que verifica, si hay un indice igual a 1 o mayor, para generar un indice enumerado.
            if indice >= 1:
                print(str(indice) + ")", lista[i])
                indice += 1
            else:
                print(lista[i])

    """
    """
    def elegir_opciones(
        self,
        lista,
        opcion_salida = "",
        opcion_elegir = ""
        ):

        if opcion_salida:
            print("0)", opcion_salida)
        if opcion_elegir:
            try:
                print("\n" + str(opcion_elegir))
                elegir = int(input("> "))
            except ValueError:
                print("\nDebes elegir un número asociado entre las opciones disponibles.")
                return 1
            if elegir == 0:
                return False
            # None
            elif (elegir >= 1 and
            elegir <= len(lista)):
                return lista[elegir - 1]
            else:
                print("\nSeleccione una de las opciones disponibles.")
                return 1
            
    """
    """
    def validar_id(
        self,
        lista,
        buscar_id # Dato que se desea buscar.
        ):

        for tarea in lista:
            if (buscar_id == tarea.get_id_tarea()
            or buscar_id == tarea.get_id_usuario()):
                return True
            else:
                return False

    """
    """
    def validar_usuarios(
        self,
        tareas
        ):

        for tarea in tareas:
            if not "Sin" in tarea.get_responsable():
                return True
            else:
                print("\nAún no existen usuarios registrados.")
                return False

    """
    """
    def usuarios_disponibles(
        self,
        tareas,
        indice = 1
        ):
        usuarios = []
        for tarea in tareas:
            if not "Sin" in tarea.get_responsable():
                print(str(indice) + ")", tarea.get_responsable())
                usuarios.append([tarea.get_nombre_usuario(), tarea.get_apellido()])
                indice += 1
        return usuarios

    """
    """
    def generar_id(
        self, 
        tarea, # Este parametro recibe una instancia de clase.
        nuevo_id = "" # Este parametro solo inicializa la variable, no es necesario colocarle otro valor.
        ):
        # Importar libreria random.
        import random
        # Variable de Números que queremos usar como base para generar el ID.
        numeros = "0123456789"
        # Longitud de la lista que devuelve, es decir, cantidad de números de vueltos.
        longitud = 6
        # Está variable toma el resultado que recibe random.
        extension = random.sample(numeros, longitud)
        # Este for da formato al ID.
        for i in extension: # Iteración de la lista generada.
           nuevo_id += i 
        return nuevo_id # Retorna el nuevo ID.

    """
    """
    def generar_menu(
        self,
        lista,
        titulo_principal = "",
        titulo_secundario = "",
        opcion_salida = "",
        opcion_elegir = ""
        ):
        # Condicional que verifica si existe un titulo secundario.
        if titulo_secundario:
            self.generar_titulo(
                titulo_principal = titulo_principal,
                titulo_secundario = titulo_secundario
            )
        else:
            self.generar_titulo(
                titulo_principal = titulo_principal
            )
        # Genera el indice entre las opciones disponibles.
        self.generar_indice(
            lista,
            indice = 1
        )
        # Seleccionarr una opción entre las disponibles.
        elegir = self.elegir_opciones(
            lista = lista,
            opcion_salida = opcion_salida,
            opcion_elegir = opcion_elegir
        )

        if elegir == 1:
            return self.generar_menu(
                lista, titulo_principal, titulo_secundario, 
                opcion_salida, opcion_elegir)

        return elegir

    def generar_responables_disponibles(
        self,
        tareas,
        titulo_principal = "",
        titulo_secundario = "",
        opcion_salida = "",
        opcion_elegir = ""
        ):
        usuarios = self.validar_usuarios(tareas)
        if not usuarios:
            return False
        # Condicional que verifica si existe un titulo secundario.
        if titulo_secundario:
            self.generar_titulo(
                titulo_principal = titulo_principal,
                titulo_secundario = titulo_secundario
            )
        else:
            self.generar_titulo(
                titulo_principal = titulo_principal
            )
        # Genera el indice entre las opciones disponibles.
        usuarios = self.usuarios_disponibles(
            tareas = tareas
        )

        # Seleccionarr una opción entre las disponibles.
        elegir = self.elegir_opciones(
            lista = usuarios,
            opcion_salida = opcion_salida,
            opcion_elegir = opcion_elegir
        )
        
        if elegir == 1:
            return self.generar_responables_disponibles(
                tareas, titulo_principal, titulo_secundario, 
                opcion_salida, opcion_elegir)



        return elegir

    def generar_lista_tarea(
        self,
        tareas,
        listar = "",
        todas = ""
        ):
        guardar_tareas = []

        # Iterar la lista donde se guardan las tareas.
        for tarea in tareas:
            if listar == tarea.get_estado():
                guardar_tareas.append(tarea)
            if listar == tarea.get_prioridad():
                guardar_tareas.append(tarea)
            if (listar[0] == tarea.get_nombre_usuario() and 
                listar[1] == tarea.get_apellido()):
                guardar_tareas.append(tarea)
            if (listar == tarea.get_nombre_tarea() or
                not listar == tarea.get_nombre_tarea() and
                "S" in todas):
                guardar_tareas.append(tarea)

        return guardar_tareas
        

    def listar_por_estado(
        self,
        tareas
        ):
        # Estados disponibles.
        estados_disponibles = ( # Están dentro de una tupla.
            "Pendiente",
            "En progreso",
            "Completada"
        )
        # Seleccionar un estado como filtro de busqueda.
        estado = self.generar_menu(
            lista = estados_disponibles,
            titulo_principal = "Estados disponibles",
            opcion_salida = "Volver",
            opcion_elegir = "Seleccione un estado:"
            )
        # Condición que verifica si se cancela, la asignación.
        if not estado:
            print("\nVolviendo al menu principal.")
            return False # Retorna False.
        # Me genera una lista donde se guardan las tareas según el filtro.
        elegir_tarea = self.generar_lista_tarea(
            tareas, 
            estado
        )
        # Acá se selecciona una tarea.
        tarea = self.generar_menu(
            lista = elegir_tarea,
            titulo_principal = "Tareas con estado:",
            titulo_secundario = estado,
            opcion_salida = "Cancelar",
            opcion_elegir = "Seleccione una tarea:"
        )
        # Condición que verifica si se cancela.
        if not tarea:
            print("\nVolviendo al menu principal.")
            return False # Retorna False.
        # Generar titulo para la tarea seleccionada.
        self.generar_titulo(
            titulo_principal = "Tarea:",
            titulo_secundario = tarea.get_nombre_tarea()
        )
        print(tarea)
        return tarea # Retorna la tarea.

    def listar_por_prioridad(
        self,
        tareas
        ):
        # Estas son las prioridades disponibles.
        prioridades_disponibles = ( # Están dentro de una tupla.
            "Alta",
            "Media",
            "Baja"
        )
        # Seleccionar una prioridad como filtro de busqueda.
        prioridad = self.generar_menu(
            lista = prioridades_disponibles,
            titulo_principal = "Prioridades disponibles",
            opcion_salida = "Volver",
            opcion_elegir = "Seleccione una prioridad:"
            )
        # Condición que verifica si se cancela, la asignación.
        if not prioridad:
            print("\nVolviendo al menu principal.")
            return False # Retorna False.
        # Me genera una lista donde se guardan las tareas según el filtro.
        elegir_tarea = self.generar_lista_tarea(
            tareas, 
            prioridad
        )
        # Acá se selecciona una tarea.
        tarea = self.generar_menu(
            lista = elegir_tarea,
            titulo_principal = "Tareas con prioridad:",
            titulo_secundario = prioridad,
            opcion_salida = "Cancelar",
            opcion_elegir = "Seleccione una tarea:"
        )
        # Condición que verifica si se cancela.
        if not tarea:
            print("\nVolviendo al menu principal.")
            return False # Retorna False.
        # Generar titulo para la tarea seleccionada.
        self.generar_titulo(
            titulo_principal = "Tarea:",
            titulo_secundario = tarea.get_nombre_tarea()
        )
        print(tarea)
        return tarea # Retorna la tarea.
    
    def filtrar_tareas_completas(
        self,
        tareas
        ):
        
        # Me genera una lista donde se guardan las tareas según el filtro.
        elegir_tarea = self.generar_lista_tarea(
            tareas, 
            "Completada"
        )
        # Acá se selecciona una tarea.
        tarea = self.generar_menu(
            lista = elegir_tarea,
            titulo_principal = "Tareas con estado:",
            titulo_secundario = "Completada",
            opcion_salida = "Cancelar",
            opcion_elegir = "Seleccione una tarea:"
        )
        # Condición que verifica si se cancela.
        if not tarea:
            print("\nVolviendo al menu principal.")
            return False # Retorna False.
        # Generar titulo para la tarea seleccionada.
        self.generar_titulo(
            titulo_principal = "Tarea:",
            titulo_secundario = tarea.get_nombre_tarea()
        )
        print(tarea)
        return tarea # Retorna la tarea.

    def generar_reporte(
        self,
        tareas
        ):
        guardar_tareas = []
        nombre_completas = []
        tareas_completas = 0
        for tarea in tareas:
            if (not "Completada" == tarea.get_estado() and
                "Alta" in tarea.get_prioridad()):
                guardar_tareas.append(tarea)
            if "Completada" == tarea.get_estado():
                nombre_completas.append(tarea.get_nombre_tarea())
                tareas_completas += 1
        #print("\n» Tareas *COMPLETADAS*:", tareas_completas, "«")
        self.generar_menu(
            lista = nombre_completas,
            titulo_principal = "Tareas completadas:",
            titulo_secundario = str(tareas_completas)
        )
        # Acá se selecciona una tarea.
        tarea = self.generar_menu(
            lista = guardar_tareas,
            titulo_principal = "Tareas de Alta prioridad:",
            titulo_secundario = "Sin Completar",
            opcion_salida = "Cancelar",
            opcion_elegir = "Seleccione una tarea:"
        )
        # Condición que verifica si se cancela.
        if not tarea:
            print("\nVolviendo al menu principal.")
            return False # Retorna False.
        # Generar titulo para la tarea seleccionada.
        self.generar_titulo(
            titulo_principal = "Tarea:",
            titulo_secundario = tarea.get_nombre_tarea()
        )
        print(tarea)
        return tarea # Retorna la tarea.
            
    def listar_por_responsable(
        self,
        tareas

        ):
        # Método que verifica si existen responsables asociados a otras tareas.
        usuario = self.generar_responables_disponibles(
            tareas = tareas,
            titulo_principal = "Usuarios Disponibles",
            opcion_salida = "Volver",
            opcion_elegir = "Seleccione un responsable:"
        )
        if not usuario:
            print("\nVolviendo al menu principal.")
            return False # Retorna False.
        print(usuario)
        elegir_tarea = self.generar_lista_tarea(
            tareas, 
            usuario
        )
        print(elegir_tarea)
        # Acá se selecciona una tarea.
        tarea = self.generar_menu(
            lista = elegir_tarea,
            titulo_principal = "Tareas con el Responsable:",
            titulo_secundario = f"{usuario[0]} {usuario[1]}",
            opcion_salida = "Cancelar",
            opcion_elegir = "Seleccione una tarea:"
        )
        # Condición que verifica si se cancela.
        if not tarea:
            print("\nVolviendo al menu principal.")
            return False # Retorna False.
        # Generar titulo para la tarea seleccionada.
        self.generar_titulo(
            titulo_principal = "Tarea:",
            titulo_secundario = tarea.get_nombre_tarea()
        )
        print(tarea)
        return tarea # Retorna la tarea.

    def listar_todas(
        self,
        tareas
        ):

        elegir_tarea = self.generar_lista_tarea(
            tareas, 
            listar="Sin",
            todas = "S"
        )
        # Acá se selecciona una tarea.
        tarea = self.generar_menu(
            lista = elegir_tarea,
            titulo_principal = "Tareas disponibles",
            opcion_salida = "Volver",
            opcion_elegir = "Seleccione una tarea:"
        )
        # Condición que verifica si se cancela.
        if not tarea:
            print("\nVolviendo al menu principal.")
            return False # Retorna False.
        # Generar titulo para la tarea seleccionada.
        self.generar_titulo(
            titulo_principal = "Tarea:",
            titulo_secundario = tarea.get_nombre_tarea()
        )
        print(tarea)
        return tarea # Retorna la tarea.
    

    # Menu de por responsable

    """
    """
    def nombrar_tarea(
        self, 
        tarea, # Este parametro recibe una instancia de clase.
        nombre_tarea = "" #  Parametro para pasar el nombre de la tarea directamente;  para inicializar una tarea con el código.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if nombre_tarea:
            return tarea.set_nombre_tarea(nombre_tarea) # Retorno que define el nombre de la tarea.
        if "Completa" in tarea.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar su *NOMBRE* «")
            return False # Retorna False.
        # Variable auxiliar que guarda el dato anterior.
        anterior_atributo = tarea.get_nombre_tarea() 
        # Verifica si existe ya un nombre definido a la tarea.
        if not "Sin" in tarea.get_nombre_tarea():
            nombre = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Deseas cambiar el nombre de la tarea"
            )
        else:
            nombre = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Desea ingresar el nombre de la tarea"
                )
        # Retorno False en caso de que no se confirme el cambio o asiganción.
        if not nombre:
            print("\nNo se ha realizado ningún cambio u asignación.")
            return False
        # Ingreso del cambio o asignación de nombre a la tarea.
        nombre_tarea = input ("\nIngrese el nombre de la tarea: ").capitalize() # Uso de capitalize() para dar formato.
        # Está condición verifica que el nuevo nombre de la tarea no sea igual al anterior.
        if anterior_atributo == nombre_tarea:
            print("\nEl nombre actual de la tarea, es el mismo que haz ingresado.")
            return self.nombrar_tarea(tarea) # De ser igual el nuevo nombre al actual, el método retornara a sí mismo.
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "Nombre", # Argumento que menciona el tipo de atributo.
            anterior_atributo = anterior_atributo, # Argumento de la variable auxiliar.
            nuevo_atributo = nombre_tarea)) # Argumento del nuevo nombre.

        return tarea.set_nombre_tarea(nombre_tarea) # Retorno que define el nombre de la tarea.

    def definir_id_tarea(
        self, 
        tarea, # Este parametro recibe una instancia de clase u objeto.
        tareas, # Recibe como parametro la lista donde se guardan las tareas.
        id_tarea = "" #  Parametro para pasar el ID de la tarea directamente;  para inicializar una tarea con el código.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if id_tarea:
            return tarea.set_id_tarea(id_tarea) # Retorno que define el ID de la tarea.
        if "Completa" in tarea.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar su *ID* «")
            return False # Retorna False.
        # Variable auxiliar que guarda el dato anterior.
        anterior_atributo = tarea.get_id_tarea() 
        # Verifica si existe ya un ID definido a la tarea.
        if not "Sin" in tarea.get_id_tarea():
            id_nuevo = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Deseas cambiar el ID de la tarea"
            )
        else:
            id_nuevo = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Desea que se asigne un ID a la tarea"
                )
        # Retorno False en caso de que no se confirme el cambio o asiganción.
        if not id_nuevo:
            print("\nNo se ha realizado ningún cambio u asignación.")
            return False
        # Ingreso del cambio o asignación de un ID a la tarea.
        id_tarea = self.generar_id(
            tarea = tarea
        )
        # Está condición verifica que el nuevo ID de la tarea no sea igual al anterior.
        if anterior_atributo == id_tarea:
            print("\nEl ID actual de la tarea, es el mismo que se ha generado.")
            return self.definir_id_tarea( # De ser igual el nuevo ID al actual, el método retornara a sí mismo.
                tarea = tarea,
                tareas = tareas
            ) 
        buscar_coincidencias = self.validar_id( # Permite buscar entre los otros IDs ya asignados, validando el ID como disponible.
            lista = tareas,
            buscar_id = id_tarea
        )
        if buscar_coincidencias:
            print("\nEl ID generado, ya está asociado a otra tarea o usuario.")
            return self.definir_id_tarea( # De ser igual el nuevo ID al de otra tarea o usuario, el método retornara a sí mismo.
                tarea = tarea,
                tareas = tareas
            ) 
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "ID", # Argumento que menciona el tipo de atributo.
            anterior_atributo = anterior_atributo, # Argumento de la variable auxiliar.
            nuevo_atributo = id_tarea)) # Argumento del nuevo ID.

        return tarea.set_id_tarea(id_tarea) # Retorno que define el ID de la tarea.

    """
    """
    def definir_descripcion(
        self, 
        tarea, # Este parametro recibe una instancia de clase.
        descripcion_tarea = "" # Parametro para pasar la descripción de la tarea directamente; para inicializar una tarea con el código.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if descripcion_tarea:
            return tarea.set_descripcion(descripcion_tarea) # Retorno que define la descripción de la tarea.
        if "Completa" in tarea.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar su *DESCRIPCIÓN* «")
            return False # Retorna False.
        # Variable auxiliar que guarda el dato anterior.
        anterior_atributo = tarea.get_descripcion() 
        # Verifica si existe ya una descripción definida en la tarea.
        if not "Sin" in tarea.get_descripcion():
            descripcion = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Deseas cambiar la descripción de la tarea"
            )
        else:
            descripcion = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Desea ingresar una descripción para la tarea"
                )
        # Retorno False en caso de que no se confirme el cambio o asiganción.
        if not descripcion:
            print("\nNo se ha realizado ningún cambio u asignación.")
            return False
        # Ingreso del cambio o asignación de la descripción de la tarea.
        descripcion_tarea = input ("\nIngrese la descripción de la tarea: ").capitalize() # Uso de capitalize() para dar formato.
        # Está condición verifica que la nueva descripción de la tarea no sea igual a la anterior.
        if anterior_atributo == descripcion_tarea:
            print("\nLa descripción actual de la tarea, es la misma que haz ingresado.")
            return self.definir_descripcion(tarea) # De ser igual la nueva descripción al actual, el método retornara a sí mismo.
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "Descripción", # Argumento que menciona el tipo de atributo.
            anterior_atributo = anterior_atributo, # Argumento de la variable auxiliar.
            nuevo_atributo = descripcion_tarea)) # Argumento de la nueva descripción.

        return tarea.set_descripcion(descripcion_tarea) # Retorno que define la descripción de la tarea.

    """
    """
    def definir_prioridad(
        self,
        tarea, # Este parametro recibe una instancia de clase.
        prioridad_tarea = "", # Parametro para pasar la prioridad de la tarea directamente; para inicializar una tarea con el código.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if prioridad_tarea:
            return tarea.set_prioridad(prioridad_tarea) # Retorno que define la prioridad de la tarea.
        # Condición que verifica si la tarea ha sido completada.
        if "Completa" in tarea.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar su *PRIORIDAD* «")
            return False # Retorna False.
        # Estas son las prioridades disponibles.
        prioridades_disponibles = ( # Están dentro de una tupla.
            "Alta",
            "Media",
            "Baja"
        )
        # Variable auxiliar que guarda el dato anterior.
        anterior_atributo = tarea.get_prioridad()
        # Verifica si existe ya un prioridad definida a la tarea.
        if not "Sin" in tarea.get_prioridad():
            prioridad = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Deseas cambiar la prioridad de la tarea"
            )
        else:
            prioridad = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Desea ingresar la prioridad de la tarea"
                )
        # Retorno False en caso de que no se confirme el cambio o asiganción.
        if not prioridad:
            print("\nNo se ha realizado ningún cambio u asignación.")
            return False
        # Ingreso del cambio o asignación de prioridad a la tarea.
        prioridad_tarea = self.generar_menu(
            lista = prioridades_disponibles,
            titulo_principal = "Prioridades disponibles",
            opcion_salida = "Cancelar",
            opcion_elegir = "Seleccione una prioridad:"
            )
        # Condición que verifica si se cancela, la asignación.
        if not prioridad_tarea:
            print("\nAsignación cancelada. No se ha modificado el atributo.")
            return False # Retorna False.
        # Está condición verifica que la nueva prioridad de la tarea para que no sea igual a la anterior.
        if anterior_atributo == prioridad_tarea:
            print("\nLa prioridad actual de la tarea, es la misma que haz ingresado.")
            return self.definir_prioridad(tarea) # De ser igual la nueva prioridad al actual, el método retornara a sí mismo.
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "Prioridad", # Argumento que menciona el tipo de atributo.
            anterior_atributo = anterior_atributo, # Argumento de la variable auxiliar.
            nuevo_atributo = prioridad_tarea)) # Argumento de la nueva prioridad.

        return tarea.set_prioridad(prioridad_tarea) # Retorno que define la prioridad de la tarea.

    """
    """
    def definir_estado(
        self,
        tarea, # Este parametro recibe una instancia de clase.
        estado_tarea = "", # Parametro para pasar el estado de la tarea directamente; para inicializar una tarea con el código.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if estado_tarea:
            return tarea.set_estado(estado_tarea) # Retorno que define el estado de la tarea.
        # Condición que verifica si la tarea ha sido completada.
        if "Completa" in tarea.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar su *ESTADO* «")
            return False # Retorna False.
        # Estas son los estados disponibles.
        estados_disponibles = ( # Están dentro de una tupla.
            "Pendiente",
            "En progreso",
            "Completada"
        )
        # Variable auxiliar que guarda el dato anterior.
        anterior_atributo = tarea.get_estado()
        # Verifica si existe ya un estado definida a la tarea.
        if not "Sin" in tarea.get_estado():
            estado = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Deseas cambiar el estado de la tarea"
            )
        else:
            estado = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Desea ingresar el estado de la tarea"
                )
        # Retorno False en caso de que no se confirme el cambio o asiganción.
        if not estado:
            print("\nNo se ha realizado ningún cambio u asignación.")
            return False
        # Ingreso del cambio o asignación del estado a la tarea.
        estado_tarea = self.generar_menu(
            lista = estados_disponibles,
            titulo_principal = "Estados disponibles",
            opcion_salida = "Cancelar",
            opcion_elegir = "Seleccione un estado:"
            )
        # Condición que verifica si se cancela, la asignación.
        if not estado_tarea:
            print("\nAsignación cancelada. No se ha modificado el atributo.")
            return False # Retorna False.
        # Está condición verifica que el nuevo estado de la tarea para que no sea igual al anterior.
        if anterior_atributo == estado_tarea:
            print("\nEl estado actual de la tarea, es el mismo que haz ingresado.")
            return self.definir_estado(tarea) # De ser igual el nuevo estado al actual, el método retornara a sí mismo.
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "Estado", # Argumento que menciona el tipo de atributo.
            anterior_atributo = anterior_atributo, # Argumento de la variable auxiliar.
            nuevo_atributo = estado_tarea)) # Argumento del nuevo estado.

        return tarea.set_estado(estado_tarea) # Retorno que define el estado de la tarea.
    
    """ Responsable """

    """
    """
    def nombrar_responsable(
        self,
        tareas, # Este parametro recibe la lista de tareas existente.
        tarea, # Este parametro recibe una instancia de clase.
        nombre = "", # Parametro para pasar el nombre del responsable directamente;  para inicializar una tarea con el código.
        apellido = "", # Parametro para pasar el apellido del responsable directamente;  para inicializar una tarea con el código.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if nombre or apellido:
            return tarea.set_responsable(nombre, apellido) # Retorno que define el nombre de la tarea.
        if "Completa" in tarea.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar su *RESPONSABLE* «")
            return False # Retorna False.
        # Variable auxiliar que guarda el dato anterior.
        anterior_nombre = tarea.get_nombre_usuario()
        anterior_apellido = tarea.get_apellido()
        # Verifica si existe ya un nombre definido a la tarea.
        if not "Sin" in tarea.get_responsable():
            responsable = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Deseas cambiar el responsable de la tarea"
            )
        else:
            responsable = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Desea ingresar el responsable de la tarea"
                )
        # Retorno False en caso de que no se confirme el cambio o asiganción.
        if not responsable:
            print("\nNo se ha realizado ningún cambio u asignación.")
            return False
        # Método que verifica si existen responsables asociados a otras tareas.
        usuario = self.generar_responables_disponibles(
            tareas = tareas,
            titulo_principal = "Usuarios Disponibles",
            opcion_salida = "Agregar otro usuario",
            opcion_elegir = "Seleccione un usuario"
         )
        # Ingreso del cambio o asignación de nombre a la tarea.
        if not usuario:
            try:
                nombre_responsable = input ("\nIngrese el nombre del resposable de la tarea: ").title() # Uso de title() para dar formato.
                apellido_responsable = input ("\nIngrese el apellido del resposable de la tarea: ").title() # Uso de title() para dar formato.
            except KeyboardInterrupt:
                print("\nDebes ingresar tanto el nombre, como el apellido.")
                return self.nombrar_responsable(tareas, tarea) # De no existir, nombre o apellido, el método retornara a sí mismo.
        else:
            nombre_responsable = usuario[0]
            apellido_responsable = usuario[1]
        # Está condición verifica que el nuevo nombre de la tarea no sea igual al anterior.
        if (anterior_nombre == nombre_responsable or
            anterior_apellido == apellido_responsable):
            print("\nEl responsable actual de la tarea, es el mismo que haz ingresado.")
            return self.nombrar_responsable(tareas, tarea) # De ser igual el nuevo responsable al actual, el método retornara a sí mismo.
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "Responsable", # Argumento que menciona el tipo de atributo.
            anterior_atributo = (anterior_nombre + " " + anterior_apellido), # Argumento de la variable auxiliar.
            nuevo_atributo = (nombre_responsable + " " + apellido_responsable))) # Argumento del nuevo responsable.

        return tarea.set_responsable(nombre_responsable, apellido_responsable) # Retorno que define el responsable de la tarea.

    """
    """
    def registrar_tarea(self, tareas):

        nueva_tarea = Tarea()

        self.nombrar_tarea(
            tarea = nueva_tarea
        )

        self.definir_id_tarea(
            tarea = nueva_tarea,
            tareas = tareas
        )
    
        self.definir_descripcion(
            tarea = nueva_tarea
        )

        self.nombrar_responsable(
            tareas = tareas,
            tarea = nueva_tarea    
        )

        self.definir_prioridad(
            tarea = nueva_tarea
        )
        
        self.definir_estado(
            tarea = nueva_tarea
        )

        return tareas.append(nueva_tarea)

    def agregar_tareas_de_prueba(self, tareas):
        tarea_1 = Tarea(nombre_tarea="Lavar pisos principales",id_tarea= "222222", descripcion="Lavar los piso del pasillo principal.", prioridad="Alta", estado="Pendiente")
        tarea_1.set_responsable("Carlos","Gonzales")
        tarea_2 = Tarea(nombre_tarea="Comprar peras", id_tarea="333333", descripcion="Comprar peras a los colaboradores.", prioridad="Baja", estado="En progreso")
        tarea_2.set_responsable("Amanda", "Gutierrez")
        tarea_3 = Tarea(nombre_tarea="Confirmar salon", id_tarea="444444", descripcion="Confirmar si el salon de eventos estará disponible.", prioridad="Alta", estado="Completada")
        tarea_3.set_responsable("Ericka", "Barrios")
        tarea_4 = Tarea(nombre_tarea="Cena con gerentes", id_tarea="555555", descripcion="Cenar con los ejecutivos", prioridad="Media", estado="En progreso")
        tarea_4.set_responsable("Kendall","Barrios")
        tarea_5 = Tarea(nombre_tarea="Cazar mamuts", id_tarea="666666", descripcion="Se escaparon mamuts del zoologico.", prioridad="Alta", estado="En progreso")
        tarea_5.set_responsable("Carlos","Gonzales")

        tareas.append(tarea_1)
        tareas.append(tarea_2)
        tareas.append(tarea_3)
        tareas.append(tarea_4)
        tareas.append(tarea_5)

    """
    """
    def actualizar_estado(
        self,
        tareas
        ):

        tarea = self.listar_por_estado(
            tareas = tareas
        )
        if not tarea:
            return False
        self.definir_estado(
            tarea = tarea
        )

    def modificar_tarea(
        self,
        tareas
        ):

        tarea = self.listar_todas(
            tareas = tareas
        )

        if not tarea:
            return False

        if "Completa" in tarea.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar ningúna *INFORMACIÓN de ella.* «")


        modificaciones_disponibles = (
            "Nombre de la tarea",
            "ID",
            "Descripción",
            "Responsable",
            "Prioridad",
            "Estado"
        )
        while True:
            modificar = self.generar_menu(
                lista = modificaciones_disponibles,
                titulo_principal = "Modificar tarea:",
                titulo_secundario = tarea.get_nombre_tarea(),
                opcion_salida = "Volver",
                opcion_elegir = "Seleccione un dato:"
            )
            if not modificar:
                print("\nVolviendo al menu principal.")
                return False
            if "Nombre de la tarea" in modificar:
                self.nombrar_tarea(
                tarea = tarea
                )
            elif "ID" in modificar:
                self.definir_id_tarea(
                    tarea = tarea,
                    tareas = tareas
                )
            elif "Descripción" in modificar:
                self.definir_descripcion(
                    tarea = tarea
                )
            elif "Responsable" in modificar:
                self.nombrar_responsable(
                    tareas = tareas,
                    tarea = tarea    
                )
            elif "Prioridad" in modificar:
                self.definir_prioridad(
                    tarea = tarea
                )
            elif "Estado" in modificar:
                self.definir_estado(
                    tarea = tarea
                )
    # guardar_tareas_txt
    def guardar_tareas_txt(
        self,
        tareas
        ):
        tareas_guardadas = open("tareas.txt", "a")
        for tarea in tareas: 
            tareas_guardadas.write(
                ("\n" + tarea.get_nombre_tarea() + " | ")
            )
        tareas_guardadas.close()
    def formatear_tareas_txt(
        self
        ):
        tareas_guardadas = open("tareas.txt", "w")
        tareas_guardadas.write(
            ""
        )
        tareas_guardadas.close()
            

    def menu_principal(
        self
        ):
        lista_de_tareas = []
        self.agregar_tareas_de_prueba(tareas=lista_de_tareas)
        menu_principal = (
            "Registrar tarea",
            "Modificar tarea",
            "Actualizar estado de tarea",
            "Listar todas las tareas",
            "Listar por Estado",
            "Listar por Prioridad",
            "Listar por Responsable",
            "Generar reporte"
        )
        while True:
            elegir = self.generar_menu(
                lista=menu_principal,
                titulo_principal="Menu principal",
                opcion_salida = "Salir",
                opcion_elegir = "Seleccione una opción:"
            )
            print(lista_de_tareas)
            if not elegir:
                salir = self.confirmar_accion(
                    "Salir del programa"
                )
                if salir:
                    return False
            if "Registrar tarea" in elegir:
                self.registrar_tarea(
                    tareas = lista_de_tareas
                )
            elif "Modificar tarea" in elegir:
                self.modificar_tarea(
                    tareas = lista_de_tareas,

                )
            elif "Actualizar estado de tarea" in elegir:
                self.actualizar_estado(
                    tareas = lista_de_tareas
                )
            elif "Listar todas las tareas" in elegir:
                self.listar_todas(
                    tareas = lista_de_tareas
                )
            elif "Listar por Estado" in elegir:
                self.listar_por_estado(
                    tareas = lista_de_tareas
                )
            elif "Listar por Prioridad" in elegir:
                self.listar_por_prioridad(
                    tareas = lista_de_tareas
                )
            elif "Listar por Responsable" in elegir:
                self.listar_por_responsable(
                    tareas = lista_de_tareas
                )
            elif "Generar reporte" in elegir:
                self.generar_reporte(
                    tareas = lista_de_tareas
                )

# Condicional para probar el código.
if __name__ == "__main__":
    lista_de_tareas = []
    gestor = GestorTareas()
    gestor.agregar_tareas_de_prueba(tareas=lista_de_tareas)
    #gestor.formatear_tareas_txt(tareas=lista_de_tareas)
    gestor.guardar_tareas_txt(tareas=lista_de_tareas)
    #gestor.menu_principal()

    
    
