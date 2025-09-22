import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

TestPanelWindow {
    id: root
    property var modelData

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
            spacing: 5

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

                        // Mostrar ID del workspace
                        Text {
                            text: workspace.id
                            color: "white"
                            font.pixelSize: 12
                            font.bold: true
                            Layout.alignment: Qt.AlignCenter
                        }

                        // Iconos individuales por aplicación
                        Repeater {
                            model: toplevels.values || []

                            Rectangle {
                                Layout.preferredWidth: 24
                                Layout.preferredHeight: 24
                                color: "transparent"
                                radius: 4

                                property var toplevel: modelData
                                property var identifier: (toplevel.lastIpcObject && toplevel.lastIpcObject.class) || (toplevel.wayland && toplevel.wayland.appId) || "unknown"

                                IconImage {
                                    anchors.fill: parent
                                    anchors.margins: 2

                                    source: {
                                        var desktopEntry = DesktopEntries.heuristicLookup(identifier) || DesktopEntries.byId(identifier);
                                        return desktopEntry && desktopEntry.icon ? Quickshell.iconPath(desktopEntry.icon) : "";
                                    }

                                    Rectangle {
                                        anchors.fill: parent
                                        visible: parent.status === Image.Error || parent.source === ""
                                        color: {
                                            if (toplevel.urgent)
                                                return "red";
                                            if (toplevel.activated)
                                                return "yellow";
                                            return "white";
                                        }
                                        radius: 2
                                        opacity: 0.7
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (toplevel.wayland) {
                                            toplevel.wayland.activate();
                                        }
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
