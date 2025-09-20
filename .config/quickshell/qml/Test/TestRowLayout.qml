import QtQuick
import QtQuick.Layouts // Para usar RowLayout.

TestPanelWindow {

    RowLayout {
        anchors.centerIn: parent
        spacing: 10 // Espacio entre los Rectangles.
        Rectangle {
            id: rect_1
            Layout.preferredWidth: 50 // Ancho
            Layout.preferredHeight: 50 // Alto
            color: "#009432"
            Layout.alignment: Qt.AlignTop // Se alinea hacia arriba.
            // Layout.fillHeight: true // true: Activa el relleno de altura para que coincida con el más alto.
            Text {
                id: text_1
                text: "Rect 1"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: rect_2
            Layout.preferredWidth: 75 // Ancho
            Layout.preferredHeight: 75 // Alto
            color: "#EE5A24"
            Layout.alignment: Qt.AlignBottom // Se alinea hacia abajo.

            Text {
                id: text_2
                text: "Rect 2"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: rect_3
            Layout.preferredWidth: 100 // Ancho
            Layout.preferredHeight: 100 // Alto
            color: "#1289A7"

            Text {
                id: text_3
                text: "Rect 3"
                anchors.centerIn: parent
            }
        }
    }
}
