import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.Test

TestPanelWindow {
    Row {
        id: root

        property var workspace
        spacing: 5

        TestWorkspacesNumber {
            workspace: root.workspace
        }

        TestWorkspacesIcon {
            workspace: root.workspace
        }
    }
}
