import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

RowLayout {
    Repeater {
        model: SystemTray.items.values
    }
}
