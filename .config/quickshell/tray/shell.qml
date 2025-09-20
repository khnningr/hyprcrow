pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.SystemTray

PanelWindow {
    WrapperRectangle {

        readonly property real padding: 5
        implicitHeight: 22
        radius: 11
        color: "red"
        leftMargin: 10
        rightMargin: 10
        visible: SystemTray.items.values.length != 0
        RowLayout {
            id: layout
            spacing: 5
            implicitWidth: children.length * 15 + (children.length - 1) * spacing
            Repeater {
                model: SystemTray.items.values
                delegate: WrapperRectangle {
                    id: wrapper
                    required property SystemTrayItem modelData

                    margin: 2
                    radius: 9
                    color: "transparent"
                    Layout.preferredWidth: 18
                    Layout.preferredHeight: 18
                    child: IconImage {
                        id: icon
                        source: wrapper.modelData.icon
                        MouseArea {
                            id: mouse
                            anchors.fill: parent
                            acceptedButtons: Qt.LeftButton | Qt.RightButton
                            cursorShape: Qt.PointingHandCursor
                            onClicked: event => {
                                if (!wrapper) {
                                    return;
                                }
                                if (event.button === Qt.LeftButton) {
                                    wrapper.modelData.activate();
                                }
                                if (event.button === Qt.MiddleButton)
                                //wrapper.modelData.secondaryActivate();
                                {}
                            }
                        }
                        QsMenuAnchor {
                            id: menuAnchor
                            menu: wrapper.modelData.menu
                            anchor.window: root.QsWindow.window ?? null
                            anchor.adjustment: PopupAdjustment.Flip
                        }
                    }
                }
            }
        }
    }
}
