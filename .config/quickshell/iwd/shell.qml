import Quickshell

import QtQuick.Controls
import Quickshell.Io
import QtQuick

PanelWindow {
    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }
    color: "transparent"
    Rectangle {
        id: bar
        property string deviceList
        anchors.centerIn: parent
        width: 100
        height: 100
        color: "gray"
        Text {
            anchors.fill: parent
            text: bar.deviceList
        }
    }

    Process {
        id: deviceList
        command: ["sh", "-c", "iwctl station wlan0 get-networks"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: bar.deviceList = this.text
        }
    }
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: deviceList.running = true
    }
}
