import QtQuick
import qs.Test

TestPanelWindow {
    Rectangle {
        anchors.centerIn: parent
        width: 200
        height: 200
        color: "#ffff00"
        border.width: 5
        border.color: "#ff00ff"
        radius: 20

        Text {
            id: textoCentral
            text: "Cartel"
            anchors.fill: parent
            wrapMode: Text.WordWrap
            font.pixelSize: parent.width / 100 * 10
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
