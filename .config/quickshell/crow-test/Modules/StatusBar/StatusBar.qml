import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import qs.Config
import qs.Modules
import qs.Modules.StatusBar.Workspace

PanelWindow {

    // PROPIEDADES
    id: statusBar
    anchors {
        // anchors: desde que puntos se toma como referencias para aclarse.
        top: true
        left: true
        right: true
    }

    implicitHeight: 40 // Altura del panel.

    color: Qt.alpha(Colors.background, 0.5) //"#20ffffff"

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
        color: Colors.background // Su color.
    }

    // Widgets
    /*
    Workspace {
        anchors.left: parent
    }
*/
    Item {

        anchors.fill: parent
        RowLayout {
            spacing: 5
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            Workspace {}
        }

        RowLayout {
            spacing: 5
            anchors.centerIn: parent

            Clock {}
        }

        RowLayout {
            spacing: 10
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
        }
    }
}
