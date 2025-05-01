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

    



    

if __name__ == "__main__":
    tarea_andy = Tarea()
    tarea_andy.nombre_tarea()



    print(tarea_andy)
    tarea_andy.nombre_tarea()
    print(tarea_andy)