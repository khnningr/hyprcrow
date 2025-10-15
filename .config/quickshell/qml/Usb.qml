import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

PanelWindow {
    id: devicePanel

    // Panel de 600x600 sin anchors
    implicitWidth: 600
    implicitHeight: 600

    color: "#2b2b2b"

    // Variables de configuración
    property string mountBaseDir: mountDirCombo.currentText
    property string defaultTerminal: "wezterm"
    property string defaultFileManager: "thunar"

    // Proceso para obtener dispositivos con lsblk (incluyendo MODEL y LABEL)
    Process {
        id: lsblkProcess
        command: ["lsblk", "-J", "-o", "NAME,MOUNTPOINT,SIZE,FSTYPE,TYPE,MODEL,LABEL"]

        property var deviceInfo: []

        stdout: StdioCollector {
            id: lsblkCollector
        }

        function isSystemPartition(mountpoint, deviceName, fstype) {
            // Excluir particiones montadas en directorios críticos del sistema
            if (mountpoint) {
                var systemMounts = ["/", "/boot", "/boot/efi", "/var", "/usr", "/tmp", "/home"];
                for (var i = 0; i < systemMounts.length; i++) {
                    if (mountpoint === systemMounts[i] || mountpoint.startsWith(systemMounts[i] + "/")) {
                        return true;
                    }
                }
            }

            // Excluir tipos de filesystem no montables
            var nonMountableFS = ["swap", "squashfs", "tmpfs", "devtmpfs", "sysfs", "proc", "cgroup", ""];
            if (nonMountableFS.includes(fstype)) {
                return true;
            }

            return false;
        }

        onExited: function (exitCode, exitStatus) {
            if (exitCode === 0) {
                try {
                    var jsonData = JSON.parse(lsblkCollector.text);
                    var diskGroups = [];

                    function processDisk(device) {
                        if (device.type === "disk" && !device.name.includes("loop")) {
                            var diskInfo = {
                                diskName: device.name,
                                diskModel: device.model || "Disco desconocido",
                                diskLabel: device.label || "",
                                diskPath: "/dev/" + device.name,
                                partitions: []
                            };

                            if (device.children) {
                                device.children.forEach(function (partition) {
                                    if (partition.type === "part" && partition.fstype && !lsblkProcess.isSystemPartition(partition.mountpoint, partition.name, partition.fstype)) {
                                        diskInfo.partitions.push({
                                            device: "/dev/" + partition.name,
                                            mountPoint: partition.mountpoint || "",
                                            isMounted: !!partition.mountpoint,
                                            size: partition.size || "",
                                            fstype: partition.fstype || "",
                                            type: partition.type,
                                            label: partition.label || ""
                                        });
                                    }
                                });
                            }

                            // Solo agregar discos que tienen particiones montables
                            if (diskInfo.partitions.length > 0) {
                                diskGroups.push(diskInfo);
                            }
                        }
                    }

                    jsonData.blockdevices.forEach(function (device) {
                        processDisk(device);
                    });

                    deviceInfo = diskGroups;
                    diskRepeater.model = diskGroups;
                    statusText.text = "Encontrados " + diskGroups.length + " discos con particiones montables";
                    statusText.color = "#4CAF50";
                } catch (e) {
                    statusText.text = "Error parsing lsblk JSON: " + e;
                    statusText.color = "#F44336";
                }
            } else {
                statusText.text = "Error ejecutando lsblk";
                statusText.color = "#F44336";
            }
        }
    }

    // Proceso para montar dispositivos
    Process {
        id: mountProcess

        property string currentDevice: ""

        stdout: StdioCollector {
            id: mountStdout
        }

        stderr: StdioCollector {
            id: mountStderr
        }

        onExited: function (exitCode, exitStatus) {
            if (exitCode === 0) {
                statusText.text = "Dispositivo " + currentDevice + " montado correctamente";
                statusText.color = "#4CAF50";
            } else {
                statusText.text = "Error al montar " + currentDevice + ": " + mountStderr.text;
                statusText.color = "#F44336";
            }
            updateTimer.start();
        }
    }

    // Proceso para desmontar dispositivos (con eliminación de carpeta)
    Process {
        id: unmountProcess

        property string currentDevice: ""

        stdout: StdioCollector {
            id: unmountStdout
        }

        stderr: StdioCollector {
            id: unmountStderr
        }

        onExited: function (exitCode, exitStatus) {
            if (exitCode === 0) {
                statusText.text = "Dispositivo " + currentDevice + " desmontado y carpeta eliminada";
                statusText.color = "#4CAF50";
            } else {
                statusText.text = "Error al desmontar " + currentDevice + ": " + unmountStderr.text;
                statusText.color = "#F44336";
            }
            updateTimer.start();
        }
    }

    // Proceso para abrir administrador de archivos
    Process {
        id: fileManagerProcess

        stdout: StdioCollector {
            id: fileManagerStdout
        }

        stderr: StdioCollector {
            id: fileManagerStderr
        }

        onExited: function (exitCode, exitStatus) {
            if (exitCode !== 0) {
                statusText.text = "Error al abrir administrador de archivos: " + fileManagerStderr.text;
                statusText.color = "#F44336";
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        // Título y controles
        RowLayout {
            Layout.fillWidth: true

            Text {
                text: "Montaje de Dispositivos USB"
                color: "white"
                font.pixelSize: 20
                font.bold: true
                Layout.fillWidth: true
            }

            Button {
                text: "Actualizar Dispositivos"
                onClicked: {
                    statusText.text = "Actualizando...";
                    lsblkProcess.running = true;
                }
            }
        }

        // Controles de configuración
        RowLayout {
            Layout.fillWidth: true

            Text {
                text: "Directorio de montaje:"
                color: "white"
                font.pixelSize: 12
            }

            ComboBox {
                id: mountDirCombo
                model: ["/mnt", "/run/media"]
                currentIndex: 0

                onCurrentTextChanged: {
                    statusText.text = "Directorio de montaje cambiado a: " + currentText;
                    statusText.color = "#4CAF50";
                }
            }

            Text {
                text: "Administrador de archivos:"
                color: "white"
                font.pixelSize: 12
            }

            ComboBox {
                id: fileManagerCombo
                model: ["GUI", "Yazi"]
                currentIndex: 0
            }
        }

        // Lista de dispositivos
        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Column {
                width: parent.width
                spacing: 10

                Repeater {
                    id: diskRepeater
                    model: []

                    delegate: Rectangle {
                        width: parent.width
                        height: diskColumn.implicitHeight + 20
                        color: "#404040"
                        radius: 8
                        border.color: "#606060"
                        border.width: 1

                        Column {
                            id: diskColumn
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 8

                            // Información del disco con label personalizado
                            Text {
                                text: {
                                    var displayText = "Disco: " + modelData.diskName;
                                    if (modelData.diskLabel && modelData.diskLabel !== "") {
                                        displayText += " | Etiqueta: " + modelData.diskLabel;
                                    }
                                    displayText += " | Modelo: " + modelData.diskModel;
                                    displayText += " (" + modelData.partitions.length + " particiones montables)";
                                    return displayText;
                                }
                                color: "white"
                                font.pixelSize: 14
                                font.bold: true
                                wrapMode: Text.WordWrap
                                width: parent.width
                            }

                            // Particiones del disco
                            Repeater {
                                model: modelData.partitions

                                delegate: Rectangle {
                                    width: diskColumn.width - 20
                                    height: partitionRow.implicitHeight + 10
                                    color: modelData.isMounted ? "#2d5a2d" : "#505050"
                                    radius: 5
                                    border.color: "#707070"
                                    border.width: 1

                                    RowLayout {
                                        id: partitionRow
                                        anchors.fill: parent
                                        anchors.margins: 8
                                        spacing: 10

                                        Column {
                                            Layout.fillWidth: true
                                            spacing: 2

                                            Text {
                                                text: modelData.device + (modelData.label && modelData.label !== "" ? " (" + modelData.label + ")" : "")
                                                color: "white"
                                                font.pixelSize: 12
                                                font.bold: true
                                            }

                                            Text {
                                                text: modelData.isMounted ? "Montado en: " + modelData.mountPoint : "No montado"
                                                color: modelData.isMounted ? "#90EE90" : "#FFB6C1"
                                                font.pixelSize: 10
                                            }

                                            Text {
                                                text: "Tamaño: " + (modelData.size || "N/A") + " | Tipo: " + (modelData.fstype || "N/A")
                                                color: "#CCCCCC"
                                                font.pixelSize: 9
                                            }
                                        }

                                        Row {
                                            spacing: 5

                                            Button {
                                                text: "Montar"
                                                enabled: !modelData.isMounted
                                                font.pixelSize: 9
                                                height: 25
                                                width: 60
                                                onClicked: {
                                                    var partitionName = modelData.device.split('/').pop();
                                                    // Usar el label si está disponible, sino usar el nombre de la partición
                                                    var folderName = (modelData.label && modelData.label !== "") ? modelData.label : partitionName;
                                                    var mountPath = mountBaseDir + "/" + folderName;

                                                    mountProcess.currentDevice = modelData.device;
                                                    mountProcess.command = ["pkexec", "sh", "-c", "mkdir -p " + mountPath + " && mount " + modelData.device + " " + mountPath];
                                                    statusText.text = "Montando " + modelData.device + " en " + mountPath + " (requiere autenticación)...";
                                                    statusText.color = "#FF9800";
                                                    mountProcess.running = true;
                                                }
                                            }

                                            Button {
                                                text: "Desmontar"
                                                enabled: modelData.isMounted
                                                font.pixelSize: 9
                                                height: 25
                                                width: 60
                                                onClicked: {
                                                    var partitionName = modelData.device.split('/').pop();
                                                    // Usar el mismo nombre que se usó para montar
                                                    var folderName = (modelData.label && modelData.label !== "") ? modelData.label : partitionName;
                                                    var mountPath = mountBaseDir + "/" + folderName;

                                                    unmountProcess.currentDevice = modelData.device;
                                                    unmountProcess.command = ["pkexec", "sh", "-c", "umount " + modelData.device + " && rmdir " + mountPath];
                                                    statusText.text = "Desmontando " + modelData.device + " y eliminando carpeta (requiere autenticación)...";
                                                    statusText.color = "#FF9800";
                                                    unmountProcess.running = true;
                                                }
                                            }

                                            Button {
                                                text: "Abrir"
                                                enabled: modelData.isMounted
                                                font.pixelSize: 9
                                                height: 25
                                                width: 60
                                                onClicked: {
                                                    var mountPath = modelData.mountPoint;

                                                    if (fileManagerCombo.currentText === "Yazi") {
                                                        // Abrir con Yazi usando wezterm como terminal predeterminado
                                                        fileManagerProcess.command = [defaultTerminal, "-e", "yazi", mountPath];
                                                    } else {
                                                        // Usar Thunar directamente
                                                        fileManagerProcess.command = [defaultFileManager, mountPath];
                                                    }

                                                    statusText.text = "Abriendo " + mountPath + " con " + fileManagerCombo.currentText;
                                                    statusText.color = "#4CAF50";
                                                    fileManagerProcess.running = true;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // Área de estado
        Text {
            id: statusText
            text: "Haz clic en 'Actualizar Dispositivos'"
            color: "#CCCCCC"
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 12
        }
    }

    // Timer para actualizar después de operaciones
    Timer {
        id: updateTimer
        interval: 2000
        onTriggered: lsblkProcess.running = true
    }

    // Cargar dispositivos inicial
    Component.onCompleted: {
        lsblkProcess.running = true;
    }
}
