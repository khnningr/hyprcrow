import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Hyprland

PanelWindow {
  id: panel

  color: "transparent"
  implicitHeight: 22

  anchors {
    left: true
    right: true
    top: true
  }

  margins {
    bottom: 0
    left: 2
    right: 2
    top: 1
  }

  Rectangle {
    anchors.fill: parent
    color: "#30ffffff"
    height: parent.height
    radius: 10
    topLeftRadius: 0
    topRightRadius: 0
    width: parent.width
  }

  RowLayout {
    anchors.verticalCenter: parent.verticalCenter
    spacing: 10

    Rectangle {
      Layout.alignment: Qt.AlignCenter
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.leftMargin: 10
      Layout.preferredHeight: 20
      Layout.preferredWidth: myApp.width
      color: "transparent"

      Text {
        id: myApp

        color: "White"
        text: "Apps"
      }
    }

    Rectangle {
      Layout.alignment: Qt.AlignCenter
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.preferredHeight: 20
      Layout.preferredWidth: myAppB.width
      color: "transparent"

      Text {
        id: myAppB

        color: "White"
        text: "QT-GTK Appmenu"
      }
    }

    Rectangle {
      Layout.alignment: Qt.AlignCenter
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.preferredHeight: 20
      Layout.preferredWidth: systray.width
      color: "transparent"

      Text {
        id: systray

        color: "White"
        text: "System Tray"
      }
    }
  }
}
