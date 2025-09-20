import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

Item {
    id: root
    required property var toplevel

    Layout.preferredWidth: 12
    Layout.preferredHeight: 12

    property var desktopEntry: {
        if (!toplevel.wayland)
            return null;
        var appId = toplevel.wayland.appId;
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
                if (toplevel.urgent)
                    return "red";
                if (toplevel.activated)
                    return "yellow";
                return "white";
            }
            radius: 2
        }
    }

    ToolTip.text: toplevel.title + (toplevel.wayland ? " (" + toplevel.wayland.appId + ")" : "")
    ToolTip.visible: mouseArea.containsMouse

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
