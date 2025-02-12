import fabric
from fabric import Application
from fabric.widgets.box import Box
from fabric.widgets.label import Label
from fabric.widgets.window import Window

if __name__ == "__main__":
    box_1 = Box(
        orientation="v",
        children=Label(label="Está es la primera box")
    )
    box_2 = Box(
        spacing=28,
        orientation="h",
        children=[
            Label(label="Este es el primer elemento en la segunda box"),
            Label(label="Este elemento de la caja es horizontal")
        ]
    )
    box_1.add(box_2)


window = Window(child=box_1)
app = Application("default", window)

app.run()