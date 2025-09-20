import QtQuick

ListView {
    model: notificationServer.trackedNotifications

    delegate: Rectangle {
        required property Notification modelData

        width: parent.width
        height: 80

        Column {
            Text {
                text: modelData.summary
                font.bold: true
            }
            Text {
                text: modelData.body
            }
        }

        // Botón para cerrar
        Button {
            text: "×"
            onClicked: modelData.dismiss()
        }
    }
}
