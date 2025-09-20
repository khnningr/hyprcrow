import QtQuick
import QtQuick.Controls
import QtQuick.Layouts  // Necesario para RowLayout
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

TestPanelWindow {
    id: root
    property var modelData

    Rectangle {
        width: 100
        height: parent.width
        color: "black"
        anchors.centerIn: parent
        radius: 200
        //anchors.centerIn: parent
        RowLayout {
            // Cambiado de Row a RowLayout
            anchors.centerIn: parent
            spacing: 5

            Repeater {
                model: Hyprland.workspaces

                Rectangle {
                    id: numberWorkspace
                    readonly property var workspace: modelData
                    readonly property var toplevels: workspace.toplevels

                    Layout.preferredWidth: 30  // Cambiado de width a Layout.preferredWidth
                    Layout.preferredHeight: 30  // Cambiado de height a Layout.preferredHeight

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
                        opacity: toplevels.length === 0 ? 1 : 0.7
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: modelData.activate()
                    }

                    // Iconos
                    RowLayout {  // Cambiado de Row a RowLayout
                        id: windowIcons
                        anchors {
                            right: parent.right
                            bottom: parent.bottom
                            margins: 2
                        }
                        spacing: 1

                        Repeater {
                            model: toplevels

                            Item {
                                Layout.preferredWidth: 12  // Cambiado de width
                                Layout.preferredHeight: 12  // Cambiado de height

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
