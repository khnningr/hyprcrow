import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets


WrapperRectangle {
    id: workspaceItem

    required property var workspace

    readonly property var toplevels: workspace.toplevels
    readonly property var groupedApps: WorkspaceLogic.groupToplevels(toplevels)

    Layout.alignment: Qt.AlignVCenter
    Layout.minimumWidth: WorkspaceLogic.workspaceMinWidth
    Layout.preferredWidth: implicitWidth
    Layout.minimumHeight: WorkspaceLogic.workspaceMinHeight

    leftMargin: 4
    rightMargin: 4
    topMargin: 2
    bottomMargin: 2

    color: WorkspaceLogic.getWorkspaceColor(workspace)
    radius: 2

    Behavior on implicitWidth {
        NumberAnimation { duration: WorkspaceLogic.workspaceAnimationDuration }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: workspaceItem.workspace.activate()
        z: -1
    }

    child: RowLayout {
        spacing: 2

        Text {
            text: workspaceItem.workspace.id
            color: WorkspaceLogic.workspaceIdColor
            font.pixelSize: WorkspaceLogic.workspaceIdFontSize
            font.bold: WorkspaceLogic.workspaceIdFontBold
            font.family: WorkspaceLogic.fontFamily

            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: workspaceItem.toplevels.values.length === 0
            horizontalAlignment: Text.AlignHCenter
        }

        Repeater {
            model: workspaceItem.groupedApps

            ToplevelGroup {
                app: modelData
            }
        }
    }
}
