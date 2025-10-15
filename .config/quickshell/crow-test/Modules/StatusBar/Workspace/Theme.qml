pragma Singleton
import Quickshell
import qs.Config

Singleton {
    // Colores
    readonly property var background: Colors.primary_container
    readonly property var focusedWorkspace: Colors.primary
    readonly property var activeWorkspace: Colors.on_primary
    readonly property var inactiveWorkspace: Colors.secondary
    readonly property var textColor: Colors.inverse_primary
    readonly property var badgeColor: "red"
    readonly property var badgeBorder: "white"

    // Fuente
    readonly property string fontFamily: "Mononoki Nerd Font"
    readonly property int workspaceIdSize: 20
    readonly property int badgeSize: 8
}
