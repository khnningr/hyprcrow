class utilidad:
    """
    Está utilidad me permite lanzar un
    mensaje de confirmación al usuario.
    """
    def confirmar(
        self,
        peticion,
    ):
        elegir = input("\n", self.peticion.upper(), "(S/N)")
        if not "S" in elegir and not "N" in elegir:
            print("\nDebes confirmar con S/N.")
        if "N" in elegir:
            return False
        return True