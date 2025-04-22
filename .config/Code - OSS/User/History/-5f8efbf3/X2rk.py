class utilidad:
    """
    Está utilidad me permite lanzar un
    mensaje de confirmación al usuario.
    """
    def confirmar(
        peticion,
    ):
        elegir = input("\n" + peticion + " (S/N): ").upper()
        if not "S" in elegir and not "N" in elegir:
            print("\nDebes confirmar con S/N.")
        if "N" in elegir:
            return False
        return True

if __name__ == "__main__":
    elegir = confirmar("Prueba")
    if elegir:
        print(elegir)