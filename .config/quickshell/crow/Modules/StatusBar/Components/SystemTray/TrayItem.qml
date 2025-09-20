import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Repeater {
    required property var windowAnchor
    model: SystemTray.items
    // Item
    Rectangle {
        id: trayItem
        Layout.preferredWidth: 18
        Layout.preferredHeight: 18

        IconImage {
            id: itemIcon

            anchors.fill: parent
            source: modelData.icon
            mipmap: true
            //sourceSize: Qt.size(width, height)
        }

        QsMenuAnchor {
            id: menuAnchor
            menu: modelData.menu
            anchor.window: windowAnchor
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
