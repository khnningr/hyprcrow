from responsable import Responsable
# Creación de la clase Tarea.
class Tarea(Responsable):
    # Método de inicialización.
    def __init__(self, 
        nombre_tarea = "- Sin nombre -", 
        id_tarea = "- Sin ID de tarea -", 
        descripcion = "- Sin descripción -", 
        responsable = "- Sin responsable -", 
        prioridad = "- Sin prioridad -", 
        estado = "- Sin estado -"
        ):
        super().__init__(
            id_usuario = "- Sin ID de usuario -", 
            nombre_usuario="- Sin nombre -", 
            apellido="- Sin apellido -", 
            mail="- Sin mail -"
            )
        # Atributos de la clase (encapsulados).
        self.__nombre_tarea = nombre_tarea
        self.__id_tarea = id_tarea
        self.__descripcion = descripcion
        self.__responsable = responsable
        self.__prioridad = prioridad
        self.__estado = estado

    """Setters"""
    # Método para cambiar el nombre.
    def set_nombre_tarea(self, nuevo_nombre):
        self.__nombre_tarea = nuevo_nombre
    # Método para cambiar el id.
    def set_id_tarea(self, nuevo_id):
        self.__id_tarea = nuevo_id
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
    def get_nombre_tarea(self):
        return self.__nombre_tarea
    # Método para obtener el id.
    def get_id_tarea(self):
        return self.__id_tarea
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
        return ("\nTarea: " + self.__nombre_tarea
        + "\nID de tarea: " + str(self.__id_tarea)
        + "\nDescripción: " + self.__descripcion
        + "\nResponsable: " + self.__responsable
        + "\nPrioridad: " + self.__prioridad
        + "\nEstado: " + self.__estado
        + "\n")    

# Condicional para probar el código.
if __name__ == "__main__":
    tareas = []
    tarea_andy = Tarea()
    tarea_andy.set_nombre_tarea("Andy")
    #print(tarea_andy.get_nombre_tarea())
    #print(tarea_andy)
    tarea_andy.get_apellido()
    #print(usuario)

    tareas.append(tarea_andy)
    print(tareas)
    for i in tareas:
        print(i)