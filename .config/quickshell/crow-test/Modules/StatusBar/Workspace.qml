import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

Item {
    id: root
    anchors.centerIn: parent

    Connections {
        target: DesktopEntries
        function onEntriesChanged() {
        // Forzar actualización de todos los iconos
        // Necesitas referenciar los IconImage específicos
        }
    }

    WrapperRectangle {
        color: "black"
        radius: 4
        anchors.centerIn: parent

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
            spacing: 2

            Repeater {
                model: Hyprland.workspaces

                WrapperRectangle {
                    id: workspaceRect
                    readonly property var workspace: modelData
                    readonly property var toplevels: workspace.toplevels

                    leftMargin: 2
                    rightMargin: 2
                    topMargin: 2
                    bottomMargin: 2

                    Layout.minimumWidth: 50
                    Layout.minimumHeight: 50

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

                    radius: 8

                    child: RowLayout {
                        spacing: 2

                        Text {
                            text: workspace.id
                            color: "white"
                            font.pixelSize: 18
                            font.bold: true
                            font.family: "Mononoki Nerd Font"

                            Layout.alignment: Qt.AlignCenter
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
                                            Layout.preferredWidth: 20
                                            Layout.preferredHeight: 20
                                            Layout.margins: 2

                                            source: {
                                                var currentToplevel = modelData || representative;
                                                if (!currentToplevel)
                                                    return "";

                                                var currentId = (currentToplevel.lastIpcObject && currentToplevel.lastIpcObject.class) || (currentToplevel.wayland && currentToplevel.wayland.appId) || "unknown";
                                                var desktopEntry = DesktopEntries.heuristicLookup(currentId) || DesktopEntries.byId(currentId);
                                                return desktopEntry && desktopEntry.icon ? Quickshell.iconPath(desktopEntry.icon, "image-missing") : Quickshell.iconPath("image-missing");
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

                        MouseArea {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            onClicked: workspace.activate()
                        }
                    }
                }
            }
        }
    }
}
