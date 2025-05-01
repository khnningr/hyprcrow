from gestor import GestorTareas

if __name__ == "__main__":
    gestor = GestorTareas()
    gestor.menu_principal()
    if not gestor.menu_principal():
        print("\nGracias por usar nuestro programa. Vuelva pronto.")

    

