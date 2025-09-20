import QtQuick

Rectangle {
    // PROPIEDADES
    // Basicamente es la línea blanca que aparece en la base del Panel.
    anchors {
        // anchors: desde que puntos se toma como referencias para aclarse.
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    height: 2 // Altura del Rectangle.
    color: "white" // Su color.
}
