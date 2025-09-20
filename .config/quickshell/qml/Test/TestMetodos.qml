import QtQuick

Rectangle {
    id: rect

    function calculateHeight(): real {
        return rect.width / 2;
    }

    width: 100
    height: calculateHeight()

    Text {
        id: label

        function moveTo(newX: real, newY: real) {
            label.x = newX;
            label.y = newY;
        }

        text: "Move me!"
    }
}
