import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

PanelWindow {

    width: Settings.windowWidth
    height: Settings.windowHeight

    Rectangle {
        anchors.fill: parent
        color: Settings.darkMode ? "#2b2b2b" : "#ffffff"
        Text {
            text: Settings.appName
        }
    }
}
