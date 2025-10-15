import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets

Item {
    id: root

    Layout.fillHeight: true
    implicitWidth: container.implicitWidth
    implicitHeight: container.implicitHeight

    WrapperRectangle {
        id: container

        color: WorkspaceLogic.containerBackground
        radius: 6
        border.width: 0
        border.color: WorkspaceLogic.containerBorder

        anchors.verticalCenter: parent.verticalCenter

        leftMargin: 10
        rightMargin: 10
        topMargin: 5
        bottomMargin: 5

        Behavior on implicitWidth {
            NumberAnimation { duration: WorkspaceLogic.containerAnimationDuration }
        }

        child: RowLayout {
            spacing: 3

            Repeater {
                model: Hyprland.workspaces

                WorkspaceItem {
                    workspace: modelData
                }
            }
        }
    }
}
