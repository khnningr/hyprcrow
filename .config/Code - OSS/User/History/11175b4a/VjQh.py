# Creación de una clase
class Personaje:
	# Método de inicialización
	def __init__(self, nombre, clase, nivel, salud, mana):
		# Atributos de la clase
		self.nombre = nombre
		self.clase = clase
		self.nivel = nivel
		self.salud = salud
		self.mana = mana
	
	# Método para atacar a un objetivo
	def ataca(self, objetivo):
		return f"{self.nombre} ataca a {objetivo}!"
	# Método para curarse a sí mismo
	def curar(self, cantidad):
		self.salud += cantidad
		return f"{self.nombre} se cura {cantidad} puntos de salud."

	# Método para obtener el nombre del personaje
	def obtener_nombre(self): # puede ser get_nombre
		return self.nombre
	# Método para obtener la salud del personaje
	def obtener_salud(self):
		return self.salud
	# Método para obtener el nivel del personaje
	def obtener_nivel(self):
		return self.nivel

	# Método para cambiar el nivel del personaje
	def set_nivel(self, nuevo_nivel):
		self.nivel = nuevo_nivel

# Clase derivada
class Mago(Personaje): # Pasamos entre () la superclase.
	def __init__(self, nombre, nivel, salud, mana, poder_magico): # Se agrega el poder_magico.
		super().__init__(
         nombre, "Mago", 
         nivel, salud, mana
         )
		self.poder_magico = poder_magico

	def lanzar_hechizo(self, hechizo, objetivo):
		if self.mana > 0:
			self.mana -= 10
			return f"{self.nombre} lanza {hechizo} a {objetivo} con poder {self.poder_magico}!"
		else:
			return f"{self.nombre} no tiene suficiente mana para lanzar {hechizo}."

mago = Mago("Gandalf", 20, 80, 100, 150)
print(mago.ataca("Orco"))
print(mago.lanzar_hechizo("Fuego", "Orco"))