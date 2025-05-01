from tarea import Tarea
class Responsable:
    def __init__(
        self,
        id_usuario = "- Sin ID de usuario -",
        nombre_usuario = "- Sin nombre -",
        apellido = "- Sin apellido -",
        mail = "- Sin mail -"
        ):
        
        self.__id_usuario = id_usuario
        self.__nombre_usuario = nombre_usuario
        self.__apellido = apellido
        self.__mail = mail

    
    def set_id_usuario(self, nuevo_id):
        self.__id_usuario = nuevo_id
    
    def set_nombre_usuario(self, nuevo_nombre):
        self.__nombre_usuario = nuevo_nombre

    def set_apellido(self, nuevo_apellido):
        self.__apellido = nuevo_apellido
    
    def set_mail(self, nuevo_mail):
        self.__mail = nuevo_mail

    def get_id_usuario(self):
        return self.__id_usuario

    def get_nombre_usuario(self):
        return self.__nombre_usuario

    def get_apellido(self):
        return self.__apellido

    def get_mail(self):
        return self.__mail

    def __str__(self):
        return (
            "\nID de usuario: " + self.__id_usuario
            + "\nNombre: " + self.__nombre_usuario
            + "\nApellido: " + self.__apellido
            + "\nMail: " + self.__mail
        )
    
if __name__ == "__main__":
    usuario = Responsable()
    print(usuario)