import QtQuick

// Declaración e inicialización de variables.
Item {
    property var nombre: "QML"
    property var someNumber: 1.5
    property var someString: "abc"
    property var someBool: true
    property var someList: [1, 2, "three", "four"]
    property var someObject: Rectangle {
        width: 100
        height: 100
        color: "red"
    }
}
