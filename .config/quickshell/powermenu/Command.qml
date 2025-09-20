import QtQuick
import Quickshell.Io

QtObject {
    id: boton

    required property string command

    readonly property var comando: Process {
        command: ["sh", "-c", boton.command]
    }

    function exec() {
        comando.startDetached();
        Qt.quit();
    }
}
