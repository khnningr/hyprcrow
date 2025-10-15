import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

Item {
    id: root
    //anchors.centerIn: parent

    Layout.fillHeight: true
    implicitWidth: wrapperContainer.implicitWidth
    implicitHeight: wrapperContainer.implicitHeight

    WrapperRectangle {
        id: wrapperContainer
        color: "black"
        radius: 6
        //height: statusBar.height > 0 ? statusBar.height - 10 : 40
        anchors.verticalCenter: parent.verticalCenter
        border.width: 0
        //resizeChild: false

        leftMargin: 10
        rightMargin: 10
        topMargin: 5
        bottomMargin: 5

        Behavior on implicitWidth {
            NumberAnimation {
                duration: 200
            }
        }

        child: RowLayout {
            spacing: 3

            Repeater {
                model: Hyprland.workspaces

                WrapperRectangle {
                    id: wrapperWorkspace
                    readonly property var workspace: modelData
                    readonly property var toplevels: workspace.toplevels

                    Layout.alignment: Qt.AlignVCenter

                    Layout.minimumWidth: 30

                    Layout.preferredWidth: implicitWidth

                    leftMargin: 4
                    rightMargin: 4
                    topMargin: 2
                    bottomMargin: 2

                    Layout.minimumHeight: 32

                    Behavior on implicitWidth {
                        NumberAnimation {
                            duration: 150
                        }
                    }

                    color: {
                        if (workspace.focused)
                            return "blue";
                        if (workspace.active)
                            return "lightblue";
                        return "gray";
                    }

                    radius: 2

                    MouseArea {
                        anchors.fill: parent
                        onClicked: workspace.activate()
                        z: -1  // Para que no interfiera con los clicks en los iconos
                    }

                    child: RowLayout {
                        spacing: 2

                        Text {
                            id: textWorkspaceID
                            text: workspace.id
                            color: "white"
                            font.pixelSize: 20 //
                            font.bold: true
                            font.family: "Mononoki Nerd Font"

                            Layout.alignment: Qt.AlignCenter
                            Layout.fillWidth: toplevels.values.length === 0  // Añade esta línea
                            horizontalAlignment: Text.AlignHCenter  // Añade esta línea
                        }

                        Repeater {
                            model: {
                                var toplevelsList = toplevels.values || [];
                                var grouped = {};
                                var apps = [];

                                for (var i = 0; i < toplevelsList.length; i++) {
                                    var toplevel = toplevelsList[i];
                                    if (!toplevel)
                                        continue;

                                    var appId = (toplevel.lastIpcObject && toplevel.lastIpcObject.class) || (toplevel.wayland && toplevel.wayland.appId) || "unknown";

                                    if (!grouped[appId]) {
                                        grouped[appId] = {
                                            representative: toplevel,
                                            count: 0,
                                            instances: []
                                        };
                                        apps.push(grouped[appId]);
                                    }

                                    grouped[appId].count++;
                                    grouped[appId].instances.push(toplevel);
                                }

                                return apps;
                            }

                            Rectangle {

                                Layout.preferredWidth: app && app.count > 1 && isHovered ? app.count * 26 : 24
                                Layout.preferredHeight: 24
                                color: "transparent"
                                radius: 4

                                property var app: modelData
                                property var representative: app ? app.representative : null
                                property var identifier: representative ? ((representative.lastIpcObject && representative.lastIpcObject.class) || (representative.wayland && representative.wayland.appId) || "unknown") : ""
                                property bool isHovered: false

                                Behavior on Layout.preferredWidth {
                                    NumberAnimation {
                                        duration: 200
                                    }
                                }

                                RowLayout {
                                    anchors.fill: parent
                                    spacing: 2

                                    Repeater {
                                        model: (app && app.count > 1 && parent.parent.isHovered) ? app.instances : [representative]

                                        IconImage {
                                            implicitSize: 20
                                            Layout.margins: 2
                                            asynchronous: true
                                            property int updateTrigger: 0
                                            source: {
                                                updateTrigger;

                                                var currentToplevel = modelData || representative;
                                                if (!currentToplevel)
                                                    return "";

                                                var currentId = (currentToplevel.lastIpcObject && currentToplevel.lastIpcObject.class) || (currentToplevel.wayland && currentToplevel.wayland.appId) || "unknown";

                                                var desktopEntry = DesktopEntries.heuristicLookup(currentId);
                                                return desktopEntry && desktopEntry.icon ? Quickshell.iconPath(desktopEntry.icon, "image-missing") : Quickshell.iconPath("image-missing");
                                            }
                                            Component.onCompleted: {
                                                // Forzar actualización después de 100ms
                                                Qt.callLater(function () {
                                                    updateTrigger++;
                                                });
                                            }

                                            MouseArea {
                                                anchors.fill: parent
                                                onClicked: {
                                                    var toplevel = modelData || representative;
                                                    if (toplevel && toplevel.wayland) {
                                                        toplevel.wayland.activate();
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                Rectangle {
                                    visible: app && app.count > 1 && !parent.isHovered
                                    width: 12
                                    height: 12
                                    color: "red"
                                    radius: 6
                                    anchors.top: parent.top
                                    anchors.right: parent.right
                                    anchors.topMargin: -2
                                    anchors.rightMargin: -2
                                    border.width: 1
                                    border.color: "white"

                                    Text {
                                        text: app ? app.count.toString() : ""
                                        color: "white"
                                        anchors.centerIn: parent
                                        font.pixelSize: 8
                                        font.bold: true
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    acceptedButtons: Qt.NoButton

                                    onContainsMouseChanged: {
                                        parent.isHovered = containsMouse && app && app.count > 1;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
