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
    def banner(
        self,
        titulo,
        titulo_secundario = ""
        ):
    
        titulo = titulo.upper()
        titulo_secundario = titulo_secundario.upper()
        if titulo_secundario:
            print("\n._-_-_«", titulo, titulo_secundario, "»_-_-_.\n")
        else:
            print("\n._-_-_«", titulo, "»_-_-_.\n") # El método upper convierte todas las letras a mayúsculas.

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

    def nombrar_tarea(
        self, nombre_tarea = "" # Puedes pasar como parametro, el nombre de la tarea directamente; para inicializar tareas.
        ):
        # Condición que verifica si la tarea debe iniciarse junto con el programa.
        if nombre_tarea:
            return self.set_nombre(nombre_tarea) # Retorno que define el nombre de la tarea.
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
        #
        if anterior_atributo == nombre_tarea:
            print("\nEl nombre actual de la tarea, es el mismo que haz ingresado.")
            return self.nombrar_tarea() #
        print(self.mensaje_confirmacion( # Mensaje que confirma el cambio o asignación visualemente.
            tipo_atributo = "Descripción", # Argumento de tipo de atributo pasado.
            anterior_atributo = anterior_atributo, # Argumento de la variable auxiliar.
            nuevo_atributo = nombre_tarea)) # Argumento del nuevo nombre.

        return self.set_nombre(nombre_tarea) # Retorno que define el nombre de la tarea.

    

    def ver_nombre(self):
        return self.get_nombre()

# Condicional para probar el código.
if __name__ == "__main__":
    tarea_1 = GestorTareas()
    
    print(tarea_1.get_nombre())
    #tarea_1.set_nombre("Piolin")
    #tarea_1.nombrar_tarea(nombre_tarea="Artur")
    tarea_1.nombrar_tarea()
    print(tarea_1)
    tarea_1.nombrar_tarea()