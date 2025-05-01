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

    def mensaje_cambio(
        self,
        tipo_atributo,
        nuevo_atributo,
        anterior_atributo = "",
    ):
        if ("Descripción" in tipo_atributo or
        "Prioridad" in tipo_atributo):
            palabra_1 = "Nueva "
            palabra_2 = " establecida "
            
        else: 
            palabra_1 = "Nuevo "
            palabra_2 = " establecido "
        if not "Sin" in anterior_atributo:
            return("\n" + palabra_1 + tipo_atributo 
            + palabra_2 + "a la tarea de '" + anterior_atributo + "'" 
            + " a " + "'" + nuevo_atributo + "'.")
        else:
            return("\n» Se ha asignado " + "'" + nuevo_atributo + "'" + " como " + tipo_atributo 
            + " a la tarea «")
        # Agregar mensaje para nuevos atributos.

    def nombrar_tarea(
        self,
        nombre_tarea = ""
        ):

        if nombre_tarea:
            return self.set_nombre(nombre_tarea)

        anterior_atributo = self.get_nombre()

        if not "- Sin nombre -" in self.get_nombre():
            nombre = self.confirmar_accion(
                peticion = "Deseas cambiar el nombre de la tarea"
            )
        
        else:
            nombre = self.confirmar_accion(
                peticion = "Desea ingresar el nombre de la tarea"
                )

        if not nombre:
            print("\nNo se ha realizado ningún cambio u asignación.")
            return False
        
        nombre_tarea = input ("\nIngrese el nombre de la tarea: ")
        print(self.mensaje_cambio(
            tipo_atributo = "Nombre",
            anterior_atributo = anterior_atributo,
            nuevo_atributo = nombre_tarea))

        return self.set_nombre(nombre_tarea)

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