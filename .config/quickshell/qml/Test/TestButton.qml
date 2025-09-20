import Quickshell
import QtQuick // Necesario para Text.
import QtQuick.Controls // Necesario para usar Button.

PanelWindow {
    id: root
    implicitHeight: 400
    implicitWidth: 400
    color: "gray"
    anchors {
        right: true
        bottom: true
    }

    Button {
        id: testButtonn // Identificador del botón.
        width: 300 // Largo del botón.
        height: 75 // Anchura del botón.
        // text: "Click Me" // Texto dentro del botón.
        anchors.centerIn: parent // Punto de anclaje o referencia del botón.
        //highlighted: true

        // Podria ser una buena practica definir los texto por aparte,
        // de un botón por ejemplo, para hacer más legible y definir,
        // de mejor forma las propiedades del texto por aparte, además
        // de aprovechar las propiedades como objeto.
        Text {
            id: testButtonText // Identificador del texto.
            text: "Click Me, hola mundo, cómo estás, estoy aprendiendo QML." // Texto dentro del botón.
            color: "white" // Color del texto.
            anchors.fill: parent // Punto de anclaje o referencia del texto.
            horizontalAlignment: Text.AlignHCenter // Aliniación horizontal.
            verticalAlignment: Text.AlignVCenter // Aliniación vertical.
            elide: Text.ElideRight // Permite que el texto no se desplace fuera del botón.
            font.family: "IosevkaTerm Nerd Font" // Establece la fuente. Usa el comando 'fc-list | grep "Nerd"' para ver las fuentes en el PC.
            font.pointSize: 12 // Tamaño de la fuente.
            font.bold: true // Activa el efecto Bold (negrita) en el texto.
        }
        // La acción al ser precionado.
        onClicked: {
            console.log("Botón presionado."); // console.log: Sirve para mostrar salidas en terminal.
        }

        // Estilo del botón.
        background: Rectangle {
            color: TestButton.pressed ? "#0097e6" : "#273c75" // No funciona, hay que revisar esto.
            radius: 5 // Permite definir el radio del botón.
        }
    }
}
