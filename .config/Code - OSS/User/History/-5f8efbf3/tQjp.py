class utilidad:
    def confirmar(
        __peticion,
    ):
    """
    Está utilidad me permite lanzar un
    mensaje de confirmación al usuario.
    """
        elegir = ("\n", __peticion.upper(), "(S/N)")
        if not "S" in elegir and not "N" in elegir:
            print("\nDebes confirmar con S/N.")
        if "N" in elegir:
            return False
        return True