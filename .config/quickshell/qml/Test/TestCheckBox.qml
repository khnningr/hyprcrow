// Ejemplo de como hacer un checkbox.

import Quickshell
import QtQuick // Necesario para Text.
import QtQuick.Controls // Necesario para usar CheckBox.

PanelWindow {
    implicitHeight: 400
    implicitWidth: 400
    color: "gray"

    CheckBox {
        id: testCheckBox // Identificador del checkbox.
        checked: true // Establece el check activo con true o desactivado con false (por defecto es false).
        anchors.centerIn: parent // Punto de anclaje o referencia del checkbox.
        width: 400 // Establece el ancho alrededor del CheckBox.
        height: 100 // Establece la altura alrededor del CheckBox.
        // text: "Check Me" // Texto del CheckBox.

        // Formato o estilo del texto dentro del CheckBox.
        Text {
            id: testCheckBoxText
            text: "Check Me" // Texto del CheckBox.
            font.pointSize: 15 // Tamaño del font.
            font.bold: true // Activar o desactivar el efecto bold (negrita) en el font.
            color: "#38ada9" // Color de la font.
            // Posición del texto.
            // x: Toma como referencia el 'x' del Indicador sumando el grosor del Indicador, y a eso se le suma 10.
            x: ((testCheckBoxIndicator.x + testCheckBoxIndicator.width) + 10) // Desplaza el indicador tomando como referencia el eje 'x'.
            // y: Restamos la altura al rededor del CheckBox con la altura del mismo Texto y lo dividimos a la mitad, es decir, 2.
            y: ((testCheckBox.height - testCheckBoxText.height) / 2) // Desplaza el indicador tomando como referencia el eje 'y'.
        }

        // Evento al hacer Check.
        onCheckedChanged: {
            // console.log: Sirve para mostrar salidas en terminal.
            console.log("CheckBox Status: " + checked); // checked: Retorna un Bool del Check.
        }

        // Estilo del fondo o alrededor del CheckBox; sí se habla del fondo.
        background: Rectangle {
            border.width: 5 // Grosor del borde en el Rectangle.
            border.color: "#fa983a" // Color del borde en el Rectangle.
            color: "white" // "#20ffffff" // Color dentro del Rectangle.
        }

        // Indicadores del CheckBox: Modifica la apariencia del CheckBox en si.
        indicator: Rectangle {
            id: testCheckBoxIndicator
            implicitWidth: 50 // Ancho del indicador.
            implicitHeight: 50 // Alto del indicador.
            radius: 10 // Radio del indicador.
            border.color: "#1e3799" // Color del borde del indicador.
            border.width: 3 // Grosor del borde del indicador.
            // Posición del indicador.
            x: 10 // Desplaza el indicador tomando como referencia el eje 'x'.
            // y: Restamos la altura al rededor del CheckBox con la altura del mismo Indicador y lo dividimos a la mitad, es decir, 2.
            y: ((testCheckBox.height - testCheckBoxIndicator.height) / 2) // Desplaza el indicador tomando como referencia el eje 'y'.

            // Con este Rectangle estableceremos las propiedades del Check o lo que esta dentro del CheckBox.
            Rectangle {
                visible: testCheckBox.checked // Permite visualizar cuando se toca el CheckBox.
                color: "#60a3bc" // Color del Check.
                border.color: "#60a3bc" // Color del borde del Check.
                radius: 5 // Radio del mismo Check.
                anchors.margins: 10 // Establece la distancia del margen que hay del mismo Check al Indicador.
                anchors.fill: parent // Punto de anclaje o referencia, en este caso, del padre.
            }
        }
    }
}
