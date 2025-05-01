from utilidades import utilidad

# Creación de la clase Tarea.
class Tarea:
    # Método de inicialización.
    def __init__(
        self, 
        nombre = "- Sin nombre -", 
        id = 0, 
        descripcion = "- Sin descripción -", 
        responsable = "- Sin responsable -", 
        prioridad = "- Sin prioridad -", 
        estado = "- Sin estado -"
        ):

        # Atributos de la clase (encapsulados).
        self.__nombre = nombre
        self.__id_unico = id
        self.__descripcion = descripcion
        self.__responsable = responsable
        self.__prioridad = prioridad
        self.__estado = estado

    """Setters"""
    # Método para cambiar el nombre.
    def set_nombre(self, nuevo_nombre):
        self.__nombre = nuevo_nombre

    """Getters"""
    # Método para obtener el nombre.
    def get_nombre(self):
        return self.__nombre

    """__str__"""
    # Método que devuelve la información a imprimir el objeto.
    def __str__(self):
        return ("\nTarea: " + self.__nombre 
        + "\nID: " + str(self.__id_unico)
        + "\nDescripción: " + self.__descripcion
        + "\nResponsable: " + self.__responsable
        + "\nPrioridad: " + self.__prioridad
        + "\nEstado: " + self.__estado
        + "\n")

    """
    Está utilidad me permite lanzar un
    mensaje de confirmación al usuario.
    """
    def confirmar_accion(
        self,
        peticion # Introduce una str con el mensanje que se desea mostrar.
        ):
        
        print("\n¿" + peticion + " (S/N)?")
        elegir = input("> ").upper()

        if (not "S" in elegir and
        not "N" in elegir):
            print("\nDebes confirmar con S/N.")

        if "N" in elegir:
            return False
        
        return True

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

    def mensaje_cambio(
        self,
        tipo_atributo,
        nuevo_atributo,
        anterior_atributo = "",
    ):
        if anterior_atributo:
            return("\nNuevo " + tipo_atributo + " establecido de"
            + "'" + anterior_atributo + "'" + "a" 
            + "'" + nuevo_atributo + "'" + ".")
        # Agregar mensaje para nuevos atributos.

    def nombre_tarea(
        self,
        nombre_tarea = ""
        ):

        if not "- Sin nombre -" in self.__nombre:
            nombre = self.confirmar_accion(
                peticion = "Deseas cambiar el nombre de la tarea"
            )
        
        else:
            nombre = self.confirmar_accion(
                peticion = "Desea ingresar el nombre de la tarea"
                )

        if not nombre:
            print("\nNo se ha realizado ningún cambio u asignación.")
            return self.__nombre
        
        nombre_tarea = input ("\nIngrese el nombre de la tarea: ")
        self.mensaje_cambio(
            tipo_atributo="Nombre",
            anterior_atributo="",
            nuevo_atributo=nombre_tarea
        )
        return self.set_nombre(nombre_tarea)



    

if __name__ == "__main__":
    tarea_andy = Tarea()
    tarea_andy.nombre_tarea()



    print(tarea_andy)
    tarea_andy.nombre_tarea()
    print(tarea_andy)