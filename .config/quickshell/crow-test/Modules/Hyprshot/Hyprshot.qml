import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Io

Scope {
    LazyLoader {
        id: lazyloader
        active: false
        PanelWindow {
            id: root

            anchors.top: true

            color: "transparent"

            WlrLayershell.layer: WlrLayer.Background // Coloca el panel de fondo.
            WlrLayershell.exclusionMode: ExclusionMode.Ignore // Hace que no tenga colición con otros Items.

            implicitHeight: 55
            implicitWidth: 215

            PopupWindow {
                id: popup

                implicitWidth: 215
                implicitHeight: 55

                anchor.window: root
                anchor.rect.x: root.width / 2 - width / 2
                anchor.rect.y: root.height + 10

                visible: true

                color: "transparent"

                WrapperRectangle {

                    color: "#20ffffff"
                    radius: 4
                    border.color: "#555"
                    border.width: 1

                    anchors.centerIn: parent

                    leftMargin: 10
                    rightMargin: 10
                    topMargin: 5
                    bottomMargin: 5

                    RowLayout {

                        spacing: 10

                        IconButton {
                            sourceImage: "icons/screenshot.svg"
                            command: "hyprshot -m region"
                            mssDebug: "region"
                        }
                        IconButton {
                            sourceImage: "icons/device-desktop.svg"
                            command: "hyprshot -m output"
                            mssDebug: "monitor"
                        }
                        IconButton {
                            sourceImage: "icons/table.svg"
                            command: "hyprshot -m window"
                            mssDebug: "window"
                        }
                        IconButton {
                            sourceImage: "icons/x.svg"
                            command: "exit"
                            mssDebug: "exit"
                        }
                    }
                }
            }
        }
    }
    IpcHandler {
        target: "hyprshot"

        function shot(): void {
            // comando: qs -c crow ipc call launcher toggle
            lazyloader.active = !lazyloader.active;
            if (lazyloader.active) {
                lazyloader.active = true;
            }
        }
    }
}
