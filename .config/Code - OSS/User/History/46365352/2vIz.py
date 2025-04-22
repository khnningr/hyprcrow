class Tarea:
    def __init__(
        self,
        nombre_tarea = "- Sin nombre. -",
        id_tarea = 0,
        descripcion_tarea = "- Sin descripción. -",
        responsable_tarea = "- Sin responsable. -", # Podría poner a quien regrista la tarea.
        prioridad_tarea = "- Sin prioridad asiganada. -",
        estado_tarea = "En progreso"
        ):
        self.__nombre = nombre_tarea
        self.__id_unico = id_tarea
        self.__descripcion = descripcion_tarea
        self.__responsable = responsable_tarea
        self.__prioridad = prioridad_tarea
        self.__estado = estado_tarea

    #def set_

    def __str__(self):
        return ("\nTarea: " + self.__nombre 
        + "\nID: " + str(self.__id_unico)
        + "\nDescripción: " + self.__descripcion
        + "\nResponsable: " + self.__responsable
        + "\nPrioridad: " + self.__prioridad
        + "\nEstado: " + self.__estado
        + "\n")

tarea_andy = Tarea()
print(tarea_andy)