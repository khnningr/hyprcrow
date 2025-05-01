from gestor import GestorTareas

if __name__ == "__main__":
    gestor = GestorTareas()
    menu = gestor.menu_principal()
    if not menu:
        print("\nGracias por usar nuestro programa. Vuelva pronto.")

    

