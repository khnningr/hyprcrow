import fabric
from fabric import Application
from fabric.box import Box
from fabric.widgets.label import Label
from fabric.widgets.window import Window

window = Window(
    child = Label("Hello, World"),
    all_visible=True
)

app = Application("default", window)
app.run()