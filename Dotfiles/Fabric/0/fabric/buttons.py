import fabric
from fabric import Application
from fabric.widgets.box import Box
from fabric.widgets.label import Label
from fabric.widgets.button import Button
from fabric.widgets.window import Window
 
def create_button():
    return Button(label="Click me", on_clicked=lambda b, *_: b.set_label("Haz clicado este button"))

if __name__ == "__main__":
    box = Box(
        orientation="v",
        children=[
            Label(label="Demo de botones de fabric"),
            Box(
                orientation="h",
                children=[
                    create_button(),
                    create_button(),
                    create_button(),
                    create_button(),
                ],
            ),
        ],
    )
     window = Window(child=box)
    app = Application("default", window)

    app.run()
