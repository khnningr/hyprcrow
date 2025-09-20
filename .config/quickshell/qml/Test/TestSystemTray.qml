// Ejemplo de como hacer un ComboBox; es una especie de menu desplegable.

import Quickshell
import QtQuick // Necesario para Text.
import QtQuick.Controls // Necesario para usar ComboBox.
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell.Widgets

Rectangle {
    property var generarMenu

    RowLayout {

        Repeater {
            model: SystemTray.items
            // Item
            Rectangle {
                id: trayItem
                Layout.preferredWidth: 18
                Layout.preferredHeight: 18

                IconImage {

                    anchors.fill: parent
                    source: modelData.icon
                    mipmap: true
                    //sourceSize: Qt.size(width, height)
                }

                QsMenuAnchor {
                    id: menuAnchor
                    menu: modelData.menu
                    anchor.window: generarMenu
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: mouse => {
                        if (mouse.button === Qt.LeftButton) {
                            modelData.activate();
                            console.log("Abrir."); // console.log: Sirve para mostrar salidas en terminal.
                        } else if (mouse.button === Qt.RightButton) {
                            if (modelData.hasMenu) {
                                menuAnchor.open();
                                console.log("Menu."); // console.log: Sirve para mostrar salidas en terminal.
                            }
                        }
                    }
                }
            }
        }
    }
}
