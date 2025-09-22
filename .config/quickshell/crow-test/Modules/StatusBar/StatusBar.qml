import QtQuick
import Quickshell

PanelWindow {

    // PROPIEDADES
    id: root
    anchors {
        // anchors: desde que puntos se toma como referencias para aclarse.
        top: true
        left: true
        right: true
    }
    implicitHeight: 30 // Altura del panel.
    color: "#20ffffff"

    Rectangle {
        // PROPIEDADES
        // Basicamente es la línea blanca que aparece en la base del Panel.
        anchors {
            // anchors: desde que puntos se toma como referencias para aclarse.
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 2 // Altura del Rectangle.
        color: "white" // Su color.
    }

    // Widgets
    Clock {
        id: clock
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    Workspace {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 10
    }
}
