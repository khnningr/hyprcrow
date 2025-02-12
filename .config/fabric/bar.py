import gi
import fabric
from fabric import Application
from fabric.utils.helpers import exec_shell_command
from fabric.widgets.box import Box
from fabric.widgets.button import Button
from fabric.widgets.label import Label
from fabric.widgets.datetime import DateTime
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.wayland import WaylandWindow as Window
from fabric.hyprland.widgets import Workspaces, WorkspaceButton, ActiveWindow

#from fabric.system_tray.widgets import SystemTray

from systemtray import SystemTray


from fabric.utils import (
    DesktopApp,
    get_relative_path,
    monitor_file
)

class Bar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            layer="top",
            anchor="left top right",
            margin="5px 5px -2px 5px",
            exclusivity="auto",
            
            
            **kwargs
        )
        
        # Workspaces
        self.workspaces = Workspaces(
            name="workspaces",
            spacing=4,
            #buttons=[WorkspaceButton(id=wd+1, label=None) for wd in range(5)],
            buttons_factory=lambda ws_id: WorkspaceButton(id=ws_id, label=None),
        )
        print(self.workspaces._active_workspace)
        
        #self.system_tray = SystemTray(name="system-tray", spacing=4, icon_size=20)
        
        self.gray = SystemTray()
        
        self.date_time = DateTime(name="date-time")
        
        
        self.picker_button = Button(
            name="picker-button",
            child=Label(label="󰈋"),
            tooltip_text="Pick color",
            on_clicked=lambda *_: self.hyprpicker()
            )
        
        self.pacman = Button(
            name="pacman",
            child=Label(
                label="📦",
                ),
            tooltip_text="Pacman",
            on_clicked=lambda *_: exec_shell_command("wezterm start sh -c 'if pkexec pacman -Syu; then if pkexec paru -Syu; then notify-send \"Sistema actualizado correctamente\"; else notify-send \"Error al actualizar con Paru\"; fi; else notify-send \"Error al actualizar con Pacman\"; fi'")
        )
        
        self.power_button = Button(
            name="power-button",
            on_clicked=lambda *_: self.power(),
            child=Label(label="⏻",),
            tooltip_text="wlogout"
        )
        
        self.active_window = ActiveWindow(name="hyprland-window")
        
        self.logo = Button(
            name="logo",
            child=Label(label=" "),
            tooltip_text="Hyprland",
            on_clicked=lambda *_: self.crow_logo(),
        )
        
        self.children = CenterBox(
            name="crow-bar",
            start_children=Box(
                spacing=2,
                orientation="h",
                children=[
                    self.logo,
                    self.active_window,
                ],
            ),
            center_children=Box(
                name="center-container",
                spacing=2,
                orientation="h",
                children=self.workspaces,
            ),
            end_children=Box(
                spacing=2,
                orientation="h",
                children=[
                    self.picker_button,
                    #self.system_tray,
                    self.gray,
                    self.date_time,
                    
                    self.power_button,
                ]
            )
        )
        
        self.show_all()
    
    def hyprpicker(self):
        exec_shell_command("hyprpicker -a -f hex")
    def power(self):
        exec_shell_command("wlogout")
    def crow_logo(self):
        exec_shell_command("rofi -show drun")
        
    
    

if __name__ == "__main__":
    bar = Bar()
    app = Application("barra", bar)
    #app.set_stylesheet_from_file(get_relative_path("style.css"))
    def apply_style(*_):
        return app.set_stylesheet_from_file(
        get_relative_path("style.css")
    )
    
    style_monitor_bar = monitor_file(get_relative_path("style.css"))
    style_monitor_colors = monitor_file(get_relative_path("fabric-colors.css"))
    style_monitor_bar.connect("changed", apply_style)
    style_monitor_colors.connect("changed", apply_style)
    apply_style() # initial styling

    app.run()
