"""
> Universidad Fidélitas
> Programación Intermedia (Curso virtual)
> Carrera: Ing. en Seguridad Informática
> Nombre del estudiante: Kendal M. Barrios
> Grupo#--
> Semana 15 — del 21 al 29 de abril de 2025
> Integración de Conocimientos II
"""

from gestor import GestorTareas

if __name__ == "__main__":
    gestor = GestorTareas()
    menu = gestor.menu_principal()
    if not menu:
        print("\nGracias por usar nuestro programa. Vuelva pronto.")

    

