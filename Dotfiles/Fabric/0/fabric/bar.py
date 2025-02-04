import fabric
from fabric import Application
from fabric.widgets.datetime import DateTime
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.wayland import WaylandWindow as Window

from fabric.system_tray.widgets import SystemTray

from fabric.utils import (
    get_relative_path,
)

class Bar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            layer="top",
            anchor="left top right",
            exclusivity="auto",
            **kwargs
        )

        self.date_time = DateTime()
        self.children = CenterBox(center_children=self.date_time)

        self.systray = SystemTray(name="systray", spacing=8, icon_size=20)


if __name__ == "__main__":
    bar = Bar()
    app = Application("bar", bar)
    app.set_stylesheet_from_file(get_relative_path("./style.css"))

    app.run()
