import Quickshell
import QtQuick
import QtQuick.Controls

Item {

    anchors.centerIn: parent

    SystemClock {
        id: clock
    }

    Label {
        property string hora: clock.hours.toString().padStart(2, '0')
        property string minutos: clock.minutes.toString().padStart(2, '0')
        property string segundos: clock.seconds.toString().padStart(2, '0')

        anchors.centerIn: parent
        text: `${hora}:${minutos}:${segundos}`
    }
}
