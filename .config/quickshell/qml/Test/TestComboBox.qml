// Ejemplo de como hacer un ComboBox; es una especie de menu desplegable.

import Quickshell
import QtQuick // Necesario para Text.
import QtQuick.Controls // Necesario para usar ComboBox.

PanelWindow {
    implicitHeight: 400
    implicitWidth: 400
    color: "gray"
    anchors {
        right: true
        bottom: true
    }

    ComboBox {
        id: testComboBox // Identificador del ComboBox.
        width: 400 // Ancho o Largo del ComboBox.
        height: 70 // Altura o grosor del ComboBox.
        anchors.centerIn: parent // Punto de anclaje o referencia; en este caso, en el centro del padre.
        currentIndex: 0 // Desde donde empieza la lista, o en que indice se inicia.
        model: testComboBoxListModel // Cual es su lista, en este caso, id del ListModel.

        // Modelo del ComboBox; de momento, entiendo que esto es una especie de
        // lista en la cual se guarda las opciones.
        ListModel {
            id: testComboBoxListModel
            // Elementos del Modelo; es decir, opciones diponibles a seleccionar.
            // key: Guarda un String que muestra el nombre de esa opción.
            ListElement {
                key: "Opción 1"
            }
            ListElement {
                key: "Opción 2"
            }
            ListElement {
                key: "Opción 3"
            }
            ListElement {
                key: "Opción 4"
            }
            ListElement {
                key: "Opción 5"
            }
        }

        // 5min
        Text {
            id: testComboBoxText
        }

        // Evento al activar un Elemento u otro.
        // Posiblemente, acá vayan condicionales.
        onActivated: {
            // console.log: Sirve para mostrar salidas en terminal.
            console.log("Selected Text: ", testComboBox.currentText); // currentText: Retorna el texto dentro del Elemento.
            console.log("Selected Index: ", testComboBox.currentIndex); // currentIndex: Retorna el indice que tiene el Elemento.
            console.log("Selected Value: ", testComboBox.currentValue); // currentValue: Retorna el valor del Elemento.
        }

        // Estilo del fondo del ComboBox.
        background: Rectangle {
            // Degradado del Rectangle; es una especie de sombreado, como si poco a poco fuera cambieando de color.
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#e84118"
                }
                GradientStop {
                    position: 1.0
                    color: "#2f3640"
                }
            }
            radius: 10 // Radio del Rectangle; del ComboBox.
        }
    }
}
