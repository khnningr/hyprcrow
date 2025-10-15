import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets


Rectangle {
    id: group

    required property var app

    readonly property var representative: app ? app.representative : null
    readonly property int count: app ? app.count : 0

    property bool isHovered: false

    Layout.preferredWidth: count > 1 && isHovered ? count * 26 : 24
    Layout.preferredHeight: 24

    color: "transparent"
    radius: 4

    Behavior on Layout.preferredWidth {
        NumberAnimation { duration: WorkspaceLogic.groupAnimationDuration }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 2

        Repeater {
            model: (group.count > 1 && group.isHovered)
                ? group.app.instances
                : [group.representative]

            ToplevelIcon {
                toplevel: modelData || group.representative
            }
        }
    }

    // Badge de contador
    Rectangle {
        visible: group.count > 1 && !group.isHovered
        width: WorkspaceLogic.badgeSize
        height: WorkspaceLogic.badgeSize
        color: WorkspaceLogic.badgeBackground
        radius: WorkspaceLogic.badgeSize / 2

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: -2
        anchors.rightMargin: -2

        border.width: 1
        border.color: WorkspaceLogic.badgeBorder

        Text {
            text: group.count.toString()
            color: WorkspaceLogic.badgeText
            anchors.centerIn: parent
            font.pixelSize: WorkspaceLogic.badgeFontSize
            font.bold: WorkspaceLogic.badgeFontBold
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton

        onContainsMouseChanged: {
            group.isHovered = containsMouse && group.count > 1;
        }
    }
}
