import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.Config

WrapperRectangle {
    color: Qt.alpha(Colors.primary_container, 0.8)

    radius: 4

    leftMargin: 10
    rightMargin: 10
    topMargin: 7
    bottomMargin: 7

    SystemClock {
        id: clock
    }

    RowLayout {

        anchors.centerIn: parent
        spacing: 10

        Label {
            property int hora12: clock.hours % 12 === 0 ? 12 : clock.hours % 12
            property string periodo: clock.hours >= 12 ? "PM" : "AM"
            property string hora: hora12.toString().padStart(2, '0')
            property string minutos: clock.minutes.toString().padStart(2, '0')

            text: `${hora}:${minutos}${periodo}`
            font.pixelSize: 16  // Cambia este valor
            color: Colors.inverse_surface
        }

        Text {
            text: "•"
            color: Qt.alpha(Colors.tertiary, 0.2)
            font.pixelSize: 10
            font.bold: true
            Layout.alignment: Qt.AlignVCenter
        }

        Label {
            property var diasSemana: ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"]
            property var meses: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"]
            property string diaSemana: diasSemana[clock.date.getDay()]
            property string numeroDia: clock.date.getDate().toString()
            property string mes: meses[clock.date.getMonth()]

            text: `${diaSemana} ${numeroDia} ${mes}`
            font.pixelSize: 16
            color: Colors.inverse_surface
        }
    }
}
