import fabric
from fabric import Application
from fabric.widgets.box import Box
from fabric.widgets.label import Label
from fabric.widgets.button import Button
from fabric.widgets.window import Window

def apagar():
    return Button(
        label="Apagar",
        on_clicked=self.exec_shell_command_async("systemctl poweroff"),
        
    )

if __name__ == "__main__":
    menu = Box(
        orientation="v",
        children=[
            Label(label="Power Menu"),
            Box(
                orientation="h",
                children=[
                    apagar(),
                ],
            )
        ]
    )
    menu_power = Window(type="popup", child=menu)
    app = Application("menu-power", menu_power)
    app.run()