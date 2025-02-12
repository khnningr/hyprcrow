import json
import logging
from typing import Any

from fabric import Fabricator
from fabric.utils import exec_shell_command
from fabric.widgets.box import Box
from fabric.widgets.eventbox import EventBox
from fabric.hyprland.widgets import WorkspaceButton

from gi.repository import Gdk  # type: ignore

log = logging.getLogger(__name__)


class NiriWorkspaces(EventBox):
    def __init__(self):
        super().__init__(events="scroll")

        # Update data each time
        Fabricator(
            interval=100,
            poll_from="niri msg -j workspaces",
            on_changed=lambda _, v: self.update_workspaces(json.loads(v)),
        )

        self.old_data = {}
        self.children = Box()

        self.connect("scroll-event", self.scroll_handler)

    def update_workspaces(self, data: list[dict[str, Any]]) -> None:
        if self.old_data != data:
            self.old_data = data

            buttons = []

            for i in data:
                idx: int = i["idx"]

                btn = WorkspaceButton(
                    id=idx,
                    label=str(idx),
                    on_clicked=lambda _, idx=idx: exec_shell_command(
                        f"niri msg action focus-workspace {idx}"
                    ),
                )
                btn.active = True if i["is_active"] else False
                buttons.append(btn)

            buttons = sorted(buttons, key=lambda b: b.id)
            self.children = Box(children=buttons)

    def scroll_handler(self, _, event):
        match event.direction:
            case Gdk.ScrollDirection.UP:
                exec_shell_command("niri msg action focus-workspace-up")
                log.info("[Workspaces] Moving to up workspace")
            case Gdk.ScrollDirection.DOWN:
                exec_shell_command("niri msg action focus-workspace-down")
                log.info("[Workspaces] Moving to down workspace")
            case _:
                return log.warning(
                    f"[Workspaces] Unknown scroll direction ({event.direction})"
                )
