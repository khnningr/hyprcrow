from gestor import GestorTareas
from tarea import Tarea



if __name__ == "__main__":
    tareas = []
    print(tareas)
    gestor = GestorTareas()
    nueva_tarea = Tarea()
    nombre = gestor.nombrar_tarea(nueva_tarea)
    print(nueva_tarea)
    print(nueva_tarea)
    tareas.append(nueva_tarea)
    
    print("iterador")
    gestor.iterador_unidimencional(tareas)

    

