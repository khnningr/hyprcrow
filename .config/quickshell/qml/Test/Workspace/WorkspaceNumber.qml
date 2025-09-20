import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    id: root
    anchors.centerIn: parent

    spacing: 10
    Repeater {
        model: Hyprland.workspaces
        Rectangle {
            id: numberRect
            property var workspace: modelData

            Layout.preferredWidth: 30  // Cambiado de width a Layout.preferredWidth
            Layout.preferredHeight: 30  // Cambiado de height a Layout.preferredHeight

            color: {
                if (modelData.focused)
                    return "blue";
                if (modelData.active)
                    return "lightblue";
                return "gray";
            }

            Text {
                anchors.centerIn: parent
                text: modelData.id
                color: "white"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: modelData.activate()
            }

            WorkspaceIcon {
                toplevels: modelData.toplevels
            }
        }
    }
}
