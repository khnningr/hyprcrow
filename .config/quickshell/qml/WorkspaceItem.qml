import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
    id: root
    required property var workspace

    readonly property var toplevels: workspace.toplevels

    Layout.preferredWidth: 30
    Layout.preferredHeight: 30

    color: {
        if (workspace.focused)
            return "blue";
        if (workspace.active)
            return "lightblue";
        return "gray";
    }

    Text {
        anchors.centerIn: parent
        text: workspace.id
        color: "white"
        opacity: toplevels.length === 0 ? 1 : 0.7
    }

    MouseArea {
        anchors.fill: parent
        onClicked: workspace.activate()
    }

    // Iconos de aplicaciones
    RowLayout {
        id: windowIcons
        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: 2
        }
        spacing: 1

        Repeater {
            model: toplevels
            delegate: AppIcon {
                toplevel: modelData
            }
        }
    }
}
