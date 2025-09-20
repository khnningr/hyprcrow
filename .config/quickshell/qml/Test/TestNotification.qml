import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications

PanelWindow {

    implicitHeight: 400
    implicitWidth: 400
    color: "gray"
    anchors {
        right: true
        bottom: true
    }

    Item {
        property var notification: TestNotificationServer.notification
        Repeater {
            model: notification
            delegate: Rectangle {
                Text {
                    text: model.sumary
                }
                Text {
                    text: model.body
                }
                Text {
                    text: model.appName
                }
            }
        }
    }
}
