import QtQuick
import QtQuick.Layouts

TestPanelWindow {
    //2.50 min
    property int index: 0

    // Puede ser RowLayout o ColumnLayout.
    RowLayout {
        spacing: 10 // El espacio que hay entre cada Rectangle.
        Rectangle {
            width: 50 // Ancho
            height: 50 // Alto
            color: "#FF0000"
            border.width: 2 // Grueso del borde del Rectangle.
            Text {
                id: rectText_1
                text: "R: " + index
                anchors.centerIn: parent
            }
        }

        Repeater {
            model: 4 // Que va a repetir: lista o cantidad en int.
            Rectangle {
                width: 50 // Ancho
                height: 50 // Alto
                color: "#FF0000"
                border.width: 2 // Grueso del borde del Rectangle.
                radius: 40
                Text {
                    id: rectText_2
                    text: "R: " + index
                    anchors.centerIn: parent
                    font.bold: true
                    font.pointSize: 10
                }
            }
        }

        Rectangle {
            width: 50 // Ancho
            height: 50 // Alto
            color: "#FF0000"
            border.width: 2 // Grueso del borde del Rectangle.
            Text {
                id: rectText_3
                text: "R: " + index
                anchors.centerIn: parent
            }
        }
    }
}
