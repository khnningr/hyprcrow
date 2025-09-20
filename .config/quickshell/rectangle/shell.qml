import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Hyprland

PanelWindow {
    id: panel

    anchors {
        left: true
        top: true
        right: true
    }

    color: "transparent"
    implicitHeight: 22

    margins {
        top: 1
        left: 2
        right: 2
        bottom: 0
    }

    Rectangle {
        anchors.fill: parent
        height: parent.height
        width: parent.width
        radius: 10
        topLeftRadius: 0
        topRightRadius: 0
        color: "#30ffffff"
    }

    RowLayout {
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        Rectangle {
            Layout.leftMargin: 10
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            Text {
                id: myApp
                text: "Apps"
                color: "White"
            }
            Layout.preferredWidth: myApp.width
            Layout.preferredHeight: 20
        }

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            Text {
                id: myAppB
                text: "QT-GTK Appmenu"
                color: "White"
            }
            Layout.preferredWidth: myAppB.width
            Layout.preferredHeight: 20
        }

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            Text {
                id: systray
                text: "System Tray"
                color: "White"
            }
            Layout.preferredWidth: systray.width
            Layout.preferredHeight: 20
        }
    }
}
