import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: root
    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }
    color: "black"

    WlrLayershell.layer: WlrLayer.Background // Coloca el panel de fondo.
    WlrLayershell.exclusionMode: ExclusionMode.Ignore // Hace que no tenga colición con otros Items.

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "stockWallpaper.jpeg"
    }
}
