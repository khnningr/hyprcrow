import QtQuick
import QtQuick.Window
import Quickshell.Hyprland
import Quickshell
import Quickshell.Services.SystemTray

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData
            color: "#282a36" // Un color de fondo oscuro
            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            ClockWidget {
                anchors.centerIn: parent
            }

            Text {
                anchors.centerIn: parent
                text: "¡Hola, Hyprland desde Quickshell!"
                color: "#f8f8f2" // Un color de texto claro
                font.pixelSize: 14
            }
        }
    }
}
