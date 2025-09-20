import QtQuick
import Quickshell
import qs.Modules.StatusBar.Position
import qs.Modules.StatusBar.Components.SystemTray

// Un Rect que contiene: Tres Rect dentro de un RowLayout.

/*
Rectangle {
    TopBar {
        id: statusBar
    }
}
*/
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

    SystemTray {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
    }
}
