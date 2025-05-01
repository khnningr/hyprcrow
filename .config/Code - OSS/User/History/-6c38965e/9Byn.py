"""
> Universidad Fidélitas
> Programación Intermedia (Curso virtual)
> Carrera: Ing. en Seguridad Informática
> Nombre del estudiante: Kendal M. Barrios
> Grupo#--
> Semana 15 — del 21 al 29 de abril de 2025
> Integración de Conocimientos II
"""

class Responsable:
    def __init__(
        self,
        nombre_usuario = "- Sin nombre -",
        apellido = "- Sin apellido -",
        ):
        
        self.__nombre_usuario = nombre_usuario
        self.__apellido = apellido

    
    def set_nombre_usuario(self, nuevo_nombre):
        self.__nombre_usuario = nuevo_nombre

    def set_apellido(self, nuevo_apellido):
        self.__apellido = nuevo_apellido

    def get_nombre_usuario(self):
        return self.__nombre_usuario

    def get_apellido(self):
        return self.__apellido

    def __str__(self):
        return (
            "Nombre: " + self.__nombre_usuario
            + "\nApellido: " + self.__apellido
        )
    
if __name__ == "__main__":
    usuario = Responsable()
    print(usuario)