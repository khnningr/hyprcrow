pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Hyprland

QtObject {
    id: logic

    // ===== DIMENSIONES =====
    readonly property int workspaceMinWidth: 30
    readonly property int workspaceMinHeight: 32
    readonly property int iconSize: 20
    readonly property int badgeSize: 12

    // ===== COLORES - WORKSPACES =====
    readonly property color focusedColor: "blue"
    readonly property color activeColor: "lightblue"
    readonly property color inactiveColor: "gray"

    // ===== COLORES - CONTENEDOR =====
    readonly property color containerBackground: "black"
    readonly property color containerBorder: "transparent"

    // ===== COLORES - BADGE =====
    readonly property color badgeBackground: "red"
    readonly property color badgeBorder: "white"
    readonly property color badgeText: "white"

    // ===== COLORES - TEXTO =====
    readonly property color workspaceIdColor: "white"

    // ===== FUENTES =====
    readonly property string fontFamily: "Mononoki Nerd Font"
    readonly property int workspaceIdFontSize: 20
    readonly property bool workspaceIdFontBold: true
    readonly property int badgeFontSize: 8
    readonly property bool badgeFontBold: true

    // ===== ANIMACIONES =====
    readonly property int containerAnimationDuration: 200
    readonly property int workspaceAnimationDuration: 150
    readonly property int groupAnimationDuration: 200

    // Función para agrupar toplevels por appId
    function groupToplevels(toplevels) {
        var toplevelsList = toplevels.values || [];
        var grouped = {};
        var apps = [];

        for (var i = 0; i < toplevelsList.length; i++) {
            var toplevel = toplevelsList[i];
            if (!toplevel) continue;

            var appId = getAppId(toplevel);

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

    function getAppId(toplevel) {
        return (toplevel.lastIpcObject && toplevel.lastIpcObject.class)
            || (toplevel.wayland && toplevel.wayland.appId)
            || "unknown";
    }

    function getWorkspaceColor(workspace) {
        if (workspace.focused) return focusedColor;
        if (workspace.active) return activeColor;
        return inactiveColor;
    }
}
