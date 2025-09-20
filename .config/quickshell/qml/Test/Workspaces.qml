import QtQuick
import Quickshell.Hyprland
import Quickshell.Widgets
import "." as Local  // Para importar tu singleton

TestPanelWindow {
    Row {
        spacing: 5

        Repeater {
            model: Local.WindowManager.allWorkspaces

            Rectangle {
                readonly property var workspace: modelData

                // Usar el singleton para números
                color: Local.WindowManager.getWorkspaceColor(workspace)

                Text {
                    text: Local.WindowManager.getWorkspaceNumber(workspace)
                    color: "white"
                }
            }
        }
    }
}
