import QtQuick
import QtQuick.Controls
import QtQuick.Layouts  // Necesario para RowLayout
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import qs.Test

TestPanelWindow {
    id: root

    Rectangle {
        width: 100
        height: parent.width
        color: "black"
        anchors.centerIn: parent
        radius: 200
        //anchors.centerIn: parent
        RowLayout {
            // Cambiado de Row a RowLayout
            anchors.centerIn: parent
            spacing: 5

            Repeater {
                id: repetidor
                model: Hyprland.workspaces

                Rectangle {
                    id: numberWorkspace

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
                    Icons {
                        levels: modelData.toplevels
                    }
                }
            }
        }
    }
}
