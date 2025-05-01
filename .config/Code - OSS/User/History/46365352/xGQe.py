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
    # Método para cambiar el id.
    def set_id(self, nuevo_id):
        self.__id_unico = nuevo_id
    # Método para cambiar la descripción.
    def set_descripcion(self, nueva_descripcion):
        self.__descripcion = nueva_descripcion
    # Método para cambiar el responsable.
    def set_responsable(self, nuevo_responsable):
        self.__responsable = nuevo_responsable
    # Método para cambiar la prioridad.
    def set_prioridad(self, nueva_prioridad):
        self.__prioridad = nueva_prioridad
    # Método para cambiar el estado.
    def set_estado(self, nuevo_estado):
        self.__estado = nuevo_estado

    """Getters"""
    # Método para obtener el nombre.
    def get_nombre(self):
        return self.__nombre
    # Método para obtener el id.
    def get_id(self):
        return self.__id_unico
    # Método para obtener la descripción.
    def get_descripcion(self):
        return self.__descripcion
    # Método para obtener el responsable.
    def get_responsable(self):
        return self.__responsable
    # Método para obtener la priodidad.
    def get_prioridad(self):
        return self.__prioridad
    # Método para obtener el estado.
    def get_estado(self):
        return self.__estado

    """__str__"""
    # Método que devuelve la información a imprimir del objeto.
    def __str__(self):
        return ("\nTarea: " + self.__nombre 
        + "\nID: " + str(self.__id_unico)
        + "\nDescripción: " + self.__descripcion
        + "\nResponsable: " + self.__responsable
        + "\nPrioridad: " + self.__prioridad
        + "\nEstado: " + self.__estado
        + "\n")    

# Condicional para probar el código.
if __name__ == "__main__":
    tarea_andy = Tarea()
    #tarea_andy.set_nombre
    tarea_andy.get_nombre()