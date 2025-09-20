import QtQuick

Item {
    QtObject {
        id: attributes
        property string name
        property int size
        property variant attributes
    }

    Text {
        text: attributes.name
    }
}
