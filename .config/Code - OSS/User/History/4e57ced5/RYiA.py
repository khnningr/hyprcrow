from gestor import GestorTareas
from tarea import Tarea



if __name__ == "__main__":
    gestor = GestorTareas()
    nueva_tarea = Tarea()
    nombre = gestor.nombrar_tarea(nueva_tarea)

