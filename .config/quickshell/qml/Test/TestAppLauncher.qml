pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io

PanelWindow {
    id: panel
    focusable: true
    implicitHeight: 400
    implicitWidth: 500
    visible: false

    Component.onCompleted: {
        if (this.WlrLayershell != null) {
            this.WlrLayershell.keyboardFocus = WlrKeyboardFocus.OnDemand;
        }
        // Dar foco inicial al TextField
        search.forceActiveFocus();
    }
    Column {
        TextField {
            id: search
            implicitWidth: panel.width
            implicitHeight: 30
            placeholderText: "Type to search"
            z: 100
            focus: true  // Foco inicial

            background: Rectangle {
                color: "white"
                border.color: "#cccccc"
                border.width: 1
                radius: 0
            }

            onTextChanged: {
                listView.currentIndex = 0;
            }

            Keys.onPressed: function (event) {
                if (event.key === Qt.Key_Down || event.key === Qt.Key_Up) {
                    // Transferir foco al ListView
                    listView.forceActiveFocus();
                    if (event.key === Qt.Key_Down && listView.currentIndex < listView.count - 1) {
                        listView.currentIndex++;
                    } else if (event.key === Qt.Key_Up && listView.currentIndex > 0) {
                        listView.currentIndex--;
                    }
                    event.accepted = true;
                } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    if (listView.count > 0) {
                        let filteredModel = DesktopEntries.applications.values.filter(a => a.name.toLowerCase().includes(search.text.toLowerCase()));
                        if (filteredModel.length > 0) {
                            filteredModel[0].execute();
                            panel.visible = false;
                        }
                    }
                    event.accepted = true;
                } else if (event.key === Qt.Key_Escape) {
                    if (text.length > 0) {
                        text = "";
                        event.accepted = true;
                    } else {
                        panel.visible = false;
                        event.accepted = true;
                    }
                }
            }
        }

        Rectangle {
            id: listContainer
            width: panel.width
            height: panel.height - search.height
            color: "transparent"
            border.color: "#cccccc"
            border.width: 1

            ListView {
                id: listView
                anchors.fill: parent

                model: ScriptModel {
                    values: DesktopEntries.applications.values.filter(a => a.name.toLowerCase().includes(search.text.toLowerCase()))
                }

                delegate: Rectangle {
                    required property DesktopEntry modelData
                    required property int index

                    width: ListView.view.width
                    height: 50
                    color: ListView.isCurrentItem ? "#3498db" : (mouseArea.containsMouse ? "#ecf0f1" : "transparent")

                    Row {
                        anchors.fill: parent
                        anchors.margins: 5
                        spacing: 10

                        IconImage {
                            width: 32
                            height: 32
                            source: Quickshell.iconPath(modelData.icon)
                            implicitSize: 32
                            mipmap: true
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: modelData.name
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            listView.currentIndex = index;
                            modelData.execute();
                            panel.visible = false;
                        }
                    }
                }

                Keys.onPressed: function (event) {
                    if (event.key === Qt.Key_Down) {
                        if (currentIndex < count - 1) {
                            currentIndex++;
                        }
                        event.accepted = true;
                    } else if (event.key === Qt.Key_Up) {
                        if (currentIndex > 0) {
                            currentIndex--;
                        }
                        event.accepted = true;
                    } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        if (count > 0 && currentIndex >= 0) {
                            let filteredModel = DesktopEntries.applications.values.filter(a => a.name.toLowerCase().includes(search.text.toLowerCase()));
                            if (currentIndex < filteredModel.length) {
                                filteredModel[currentIndex].execute();
                                panel.visible = false;
                            }
                        }
                        event.accepted = true;
                    } else if (event.key >= Qt.Key_Space && event.key <= Qt.Key_AsciiTilde) {
                        search.text += event.text;
                        search.forceActiveFocus();
                        search.cursorPosition = search.text.length;
                        event.accepted = true;
                    } else if (event.key === Qt.Key_Backspace) {
                        if (search.text.length > 0) {
                            search.text = search.text.slice(0, -1);
                            search.forceActiveFocus();
                            search.cursorPosition = search.text.length;
                        }
                        event.accepted = true;
                    } else if (event.key === Qt.Key_Escape) {
                        // Escape - devolver foco al TextField
                        search.forceActiveFocus();
                        event.accepted = true;
                    }
                }
            }
        }
    }
    IpcHandler {
        target: "launcher"

        function toggle(): void {
            // comando: qs -c crow ipc call launcher toggle
            panel.visible = !panel.visible;
            if (panel.visible) {
                search.forceActiveFocus();
            }
        }
    }
}
