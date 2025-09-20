import Quickshell
import QtQuick

// a standard desktop window
FloatingWindow {
    title: "Test de FloatingWindow"
    Timer {
        // assign an id to the object, which can be
        // used to reference it
        id: timer
        property bool invert: false // a custom property

        // change the value of invert every half second
        running: true
        repeat: true
        interval: 500 // ms
        onTriggered: timer.invert = !timer.invert
    }

    // change the window's color when timer.invert changes
    color: timer.invert ? "purple" : "green"
}
