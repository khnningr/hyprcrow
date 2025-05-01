from tarea import Tarea

class GestorTareas(Tarea):
    def __init__(self, 
        nombre = "- Sin nombre -", 
        id_tarea = 0, 
        descripcion = "- Sin descripción -", 
        responsable = "- Sin responsable -", 
        prioridad = "- Sin prioridad -", 
        estado = "- Sin estado -"
        ):
        super().__init__(nombre, id_tarea, descripcion,
        responsable, prioridad, estado)
    
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
                + " a " + "'" + nuevo_atributo.capitalize() + "' «")
            else:
                # Retorna el mensaje mostrando la asignación del atributo de la tarea.
                return("\n» Se ha asignado " + "'" + nuevo_atributo.capitalize() + "'" 
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
    def iterador_unidimencional(
        self, 
        arreglo_unidimensional, # Parametro que pasa el arreglo unidimencional
        indice = 0 # Por defecto, no imprime un indice enumerado, si se cambia a 1 o más, lo va a generar (usar 1).
        ):
        # Bucle for que itera entre los datos de una tupla o lista unidimencional.
        for i in range(len(arreglo_unidimensional)):
            # Condición que verifica, si hay un indice igual a 1 o mayor, para generar un indice enumerado.
            if indice >= 1:
                print(str(indice) + ")", arreglo_unidimensional[i])
                indice += 1
            else:
                print(arreglo_unidimensional[i])

    """
    """
    def generar_menu(
        self,
        arreglo_unidimensional,
        titulo_principal = "",
        titulo_secundario = "",
        opcion_salida = "",
        opcion_elegir = ""
        ):

        if titulo_secundario:
            self.generar_titulo(
                titulo_principal = titulo_principal,
                titulo_secundario = titulo_secundario
            )
        else:
            self.generar_titulo(
                titulo_principal = titulo_principal
            )

        self.iterador_unidimencional(
            arreglo_unidimensional,
            indice = 1
        )

        if opcion_salida:
            print("0)", opcion_salida)
        if opcion_elegir:
            print("\n" + str(opcion_elegir))
            elegir = int(input("> "))
            if elegir == 0:
                return False
            # None
            elif (elegir >= 1 and
            elegir <= len(arreglo_unidimensional)):
                return arreglo_unidimensional[elegir - 1]
            else:
                print("\nSeleccione una de las opciones disponibles.")
                return self.generar_menu(
                    arreglo_unidimensional, titulo_principal, 
                    titulo_secundario, opcion_salida, opcion_elegir)


    """
    """
    def nombrar_tarea(
        self, nombre_tarea = "" # Puedes pasar como parametro, el nombre de la tarea directamente; para inicializar tareas.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if nombre_tarea:
            return self.set_nombre(nombre_tarea) # Retorno que define el nombre de la tarea.
        if "Completa" in self.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar su *NOMBRE* «")
            return False # Retorna False.
        # Variable auxiliar que guarda el dato anterior.
        anterior_atributo = self.get_nombre() 
        # Verifica si existe ya un nombre definido a la tarea.
        if not "- Sin nombre -" in self.get_nombre():
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
            return self.nombrar_tarea() # De ser igual el nuevo nombre al actual, el método retornara a sí mismo.
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "Nombre", # Argumento que menciona el tipo de atributo.
            anterior_atributo = anterior_atributo, # Argumento de la variable auxiliar.
            nuevo_atributo = nombre_tarea)) # Argumento del nuevo nombre.

        return self.set_nombre(nombre_tarea) # Retorno que define el nombre de la tarea.

    """
    """
    def definir_descripcion(
        self, descripcion_tarea = "" # Puedes pasar como parametro, la descripción de la tarea directamente; para inicializar tareas.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if descripcion_tarea:
            return self.set_descripcion(descripcion_tarea) # Retorno que define la descripción de la tarea.
        if "Completa" in self.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar su *DESCRIPCIÓN* «")
            return False # Retorna False.
        # Variable auxiliar que guarda el dato anterior.
        anterior_atributo = self.get_descripcion() 
        # Verifica si existe ya una descripción definida en la tarea.
        if not "- Sin descripción -" in self.get_descripcion():
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
        # Está condición verifica que la nueva descripción de la tarea no sea igual al anterior.
        if anterior_atributo == descripcion_tarea:
            print("\nLa descripción actual de la tarea, es la misma que haz ingresado.")
            return self.nombrar_tarea() # De ser igual la nueva descripción al actual, el método retornara a sí mismo.
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "Descripción", # Argumento que menciona el tipo de atributo.
            anterior_atributo = anterior_atributo, # Argumento de la variable auxiliar.
            nuevo_atributo = descripcion_tarea)) # Argumento de la nueva descripción.

        return self.set_descripcion(descripcion_tarea) # Retorno que define la descripción de la tarea.

    """
    """
    def definir_prioridad(
        self, prioridad_tarea = "", # Puedes pasar como parametro, el prioridad de la tarea directamente; para inicializar tareas.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if prioridad_tarea:
            return self.set_prioridad(prioridad_tarea) # Retorno que define el prioridad de la tarea.
        # Condición que verifica si la tarea ha sido completada.
        if "Completa" in self.get_estado():
            print("\n» Está tarea ha sido completada, no puedes modificar su *PRIORIDAD* «")
            return False # Retorna False.
        prioridades_disponibles = (
            "Alta",
            "Media",
            "Baja"
        )
        # Variable auxiliar que guarda el dato anterior.
        anterior_atributo = self.get_prioridad()
        # Verifica si existe ya un prioridad definido a la tarea.
        if not "Sin" in self.get_prioridad():
            prioridad = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Deseas cambiar el prioridad de la tarea"
            )
        else:
            prioridad = self.confirmar_accion( # Solicitud de confirmación (S/N).
                peticion = "Desea ingresar el prioridad de la tarea"
                )
        # Retorno False en caso de que no se confirme el cambio o asiganción.
        if not prioridad:
            print("\nNo se ha realizado ningún cambio u asignación.")
            return False
        # Ingreso del cambio o asignación de prioridad a la tarea.
        prioridad_tarea = self.generar_menu(
            arreglo_unidimensional = prioridades_disponibles,
            titulo_principal = "Prioridades",
            opcion_salida = "Cancelar",
            opcion_elegir = "Seleccione una prioridad:"
            )
        # Está condición verifica que el nuevo prioridad de la tarea no sea igual al anterior.
        if anterior_atributo == prioridad_tarea:
            print("\nEl prioridad actual de la tarea, es el mismo que haz ingresado.")
            return self.nombrar_tarea() # De ser igual el nuevo prioridad al actual, el método retornara a sí mismo.
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "Prioridad", # Argumento que menciona el tipo de atributo.
            anterior_atributo = anterior_atributo, # Argumento de la variable auxiliar.
            nuevo_atributo = prioridad_tarea)) # Argumento del nuevo prioridad.

        return self.set_prioridad(prioridad_tarea) # Retorno que define el prioridad de la tarea.

    def ver_nombre(self):
        return self.get_nombre()

# Condicional para probar el código.
if __name__ == "__main__":
    tarea_1 = GestorTareas()
    tarea_2 = GestorTareas()
    tarea_1.set_estado("Completa")
    tarea_1.nombrar_tarea()
    tarea_1.definir_descripcion()
    tarea_1.definir_prioridad()
    tarea_1.definir_prioridad()