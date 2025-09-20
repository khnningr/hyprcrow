import QtQuick
import QtQuick.Controls
import QtQuick.Layouts  // Necesario para RowLayout
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

TestPanelWindow {
    Rectangle {
        id: rectBack
        RowLayout {
            // Cambiado de Row a RowLayout
            //anchors.centerIn: parent
            //spacing: 20 // Espacio entre rect

            Repeater {
                model: Hyprland.workspaces

                Rectangle {
                    id: numberWorkspace
                    readonly property var workspace: modelData
                    readonly property var toplevels: workspace.toplevels

                    Layout.preferredWidth: 30  // Ancho del Rect
                    Layout.preferredHeight: 30  // Alto del Rect

                    color: {
                        if (workspace.focused)
                            return "blue";
                        if (workspace.active)
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
                        onClicked: workspace.activate()
                    }

                    // Iconos
                    RowLayout {  // Cambiado de Row a RowLayout
                        id: windowIcons
                        // Cambia la pocision de los iconos
                        anchors {
                            right: parent.right
                            bottom: parent.bottom
                            margins: 2
                        }
                        spacing: 1 // Espacio entre iconos

                        Repeater {
                            model: toplevels

                            Item {
                                Layout.preferredWidth: 12  // Ancho iconos
                                Layout.preferredHeight: 12  // Alto iconos

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
