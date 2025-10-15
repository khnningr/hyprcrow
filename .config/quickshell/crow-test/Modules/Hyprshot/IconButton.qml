import QtQuick
import Quickshell
import QtQuick.Controls

import QtQuick.Layouts
import Quickshell.Io
import Qt5Compat.GraphicalEffects  // Agregar esta línea

Button {
    id: rootButton

    required property string sourceImage
    required property string mssDebug

    required property string command
    readonly property var process: Process {
        command: ["sh", "-c", rootButton.command]
    }

    Layout.preferredWidth: 40
    Layout.preferredHeight: 40

    Image {
        id: image
        anchors.centerIn: parent
        source: rootButton.sourceImage
        ColorOverlay {
            anchors.fill: parent
            source: parent
            color: "red" // o cualquier color que desees
        }
    }

    background: Rectangle {
        color: "blue"
        border.color: "#555"
        border.width: 1
        radius: 4
        // otras propiedades del fondo
    }

    onClicked: {
        if (command !== "exit") {
            process.startDetached();
        }
        console.log(mssDebug);
        Qt.quit();
    }
}
