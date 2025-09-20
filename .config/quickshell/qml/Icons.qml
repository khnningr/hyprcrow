import QtQuick
import QtQuick.Controls
import QtQuick.Layouts  // Necesario para RowLayout
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import qs.Test

RowLayout {  // Cambiado de Row a RowLayout
    id: windowIcons

    required property var levels

    anchors {
        right: parent.right
        bottom: parent.bottom
        margins: 2
    }
    spacing: 1

    Repeater {
        model: windowIcons.levels
        property var level

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
