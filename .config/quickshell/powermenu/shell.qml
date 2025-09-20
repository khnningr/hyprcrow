import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Wayland

PanelWindow {
    id: powermenu

    WlrLayershell.layer: WlrLayer.Overlay
    //exclusionMode: ExclusionMode.Ignore
    //WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    readonly property var lock: Process {
        command: ["sh", "-c", "loginctl lock-session"]
    }
    readonly property var poweroff: Process {
        command: ["sh", "-c", "systemctl poweroff"]
    }
    readonly property var reboot: Process {
        command: ["sh", "-c", "systemctl reboot"]
    }

    anchors {
        right: true
        left: true
        top: true
        bottom: true
    }
    color: "transparent"

    Row {
        Item {
            SystemTray.SystemTrayItem:
        }
        anchors.centerIn: parent
        Button {
            id: buttonLock
            width: 200
            height: 35
            //anchors.right: buttonPowerOff.left
            anchors.rightMargin: 10

            Text {
                id: lockText
                text: "Bloquear"
                font.family: "Mononoki Nerd Font"
                color: "White"
                anchors.centerIn: parent
            }
            onClicked: lock.startDetached()
        }
        Button {
            id: buttonPowerOff
            width: 200
            height: 35
            //anchors.left: buttonLock.right
            anchors.leftMargin: 5

            Text {

                text: "Apagar"
                font.family: "Mononoki Nerd Font"
                color: "White"
                anchors.centerIn: parent
            }
            onClicked: poweroff.startDetached()
        }
        Button {
            onClicked: Qt.quit()
            Text {
                text: "Cancelar"
                font.family: "Mononoki Nerd Font"
            }
        }
    }
}
