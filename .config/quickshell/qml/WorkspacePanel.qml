import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import qs.Test

PanelWindow {
    id: root
    required property var modelData

    Rectangle {
        width: 100
        height: parent.width
        color: "black"
        anchors.centerIn: parent
        radius: 200

        RowLayout {
            anchors.centerIn: parent
            spacing: 5

            Repeater {
                model: Hyprland.workspaces
                delegate: WorkspaceItem {
                    workspace: modelData
                }
            }
        }
    }
}
