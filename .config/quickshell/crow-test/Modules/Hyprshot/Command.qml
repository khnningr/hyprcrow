import QtQuick
import Quickshell.Io

Process {
    id: rootCommand

    required property string prueba

    readonly property var process: Process {
        command: ["sh", "-c", rootCommand.command]
    }

    function exec() {
        process.startDetached();
        Qt.quit();
    }
}
