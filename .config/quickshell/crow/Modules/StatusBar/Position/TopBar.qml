import QtQuick
import Quickshell
import QtQuick.Layouts
import qs.Modules.StatusBar.Components.SystemTray

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

    // Distribución de los módulos.
    Rectangle {
        id: statusBar
        height: parent.height
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }
        color: "black"

        RowLayout {
            id: moduleRow
            height: statusBar.height
            width: statusBar.width// / 4
            anchors {
                left: statusBar.left
                //right: statusBar.right
                top: statusBar.top
            }
            spacing: 0 // Espacio entre los Rectangles.

            SystemTray {}
        }
    }

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
}
