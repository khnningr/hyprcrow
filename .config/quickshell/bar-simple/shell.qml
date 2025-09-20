import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

WlrLayershell.layer: WlrLayer.Background {

    color: "transparent"

    anchors {
        left: true
        top: true
        right: true
        bottom: true
    }

    RowLayout {
        Rectangle {
            width: 400
            height: 320
            color: "blue"
            RowLayout {
                Button {
                    text: "Apagar"
                }
                Button {
                    text: "Reiniciar"
                }
            }
        }
        Rectangle {
            width: 400
            height: 320
            color: "blue"
            ColumnLayout {
                Button {
                    anchors {
                        left: true
                    }
                    text: "Apagar"
                }
                Button {
                    text: "Reiniciar"
                }
            }
        }
    }
}
