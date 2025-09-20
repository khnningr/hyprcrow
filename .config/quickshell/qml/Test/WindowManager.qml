import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

TestPanelWindow {
    Rectangle {
        width: 100
        height: numberWorkspace.width
        color: "black"
        anchors.centerIn: parent
        radius: 200

        RowLayout {
            anchors.centerIn: parent
            spacing: 5

            Repeater {
                model: Hyprland.workspaces

                RowLayout {
                    readonly property var workspace: modelData
                    readonly property var toplevels: workspace.toplevels
                    spacing: 2

                    // Rectángulo estático del workspace
                    Rectangle {
                        id: numberWorkspace
                        Layout.preferredWidth: 30
                        Layout.preferredHeight: 30

                        color: {
                            if (workspace.focused)
                                return "blue";
                            if (modelData.active)
                                return "lightblue";
                            return "gray";
                        }

                        Text {
                            anchors.centerIn: parent
                            text: workspace.id
                            color: "white"
                            font.bold: true
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: modelData.activate()
                        }
                    }

                    // Rectángulo dinámico para iconos
                    Rectangle {
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: Math.max(iconRow.implicitWidth + 4, 0)
                        color: "darkgray"
                        radius: 5
                        visible: toplevels.length > 0

                        RowLayout {
                            id: iconRow
                            anchors.centerIn: parent
                            spacing: 1

                            Repeater {
                                model: toplevels

                                Item {
                                    Layout.preferredWidth: 12
                                    Layout.preferredHeight: 12

                                    property var desktopEntry: {
                                        if (!modelData.wayland)
                                            return null;
                                        var appId = modelData.wayland.appId;
                                        return DesktopEntries.heuristicLookup(appId) || DesktopEntries.byId(appId);
                                    }

                                    IconImage {
                                        anchors.fill: parent
                                        source: {
                                            if (desktopEntry && desktopEntry.icon) {
                                                return Quickshell.iconPath(desktopEntry.icon);
                                            }
                                            return "";
                                        }
                                        mipmap: true

                                        Rectangle {
                                            anchors.fill: parent
                                            visible: parent.status === Image.Error || parent.source === ""
                                            color: {
                                                if (modelData.urgent)
                                                    return "red";
                                                if (modelData.activated)
                                                    return "yellow";
                                                return "white";
                                            }
                                            radius: 2
                                        }
                                    }

                                    ToolTip.text: modelData.title + (modelData.wayland ? " (" + modelData.wayland.appId + ")" : "")
                                    ToolTip.visible: mouseArea.containsMouse

                                    MouseArea {
                                        id: mouseArea
                                        anchors.fill: parent
                                        hoverEnabled: true
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
