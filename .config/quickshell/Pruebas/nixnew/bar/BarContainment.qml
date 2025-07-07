import QtQuick
import Quickshell
import Quickshell.Wayland
import ".."
import "../lock" as Lock

PanelWindow {
	id: root

	default property alias barItems: containment.data;

	anchors {
		left: true
		top: true
		bottom: true
	}

	width: 70
	exclusiveZone: width - margins.left

	color: "transparent"

	WlrLayershell.namespace: "shell:bar"

	readonly property var tooltip: tooltip;
	Tooltip {
		id: tooltip
		bar: root
	}

	readonly property real tooltipXOffset: root.width + 2;

	function boundedY(targetY: real, height: real): real {
		return Math.max(barRect.anchors.topMargin + height, Math.min(barRect.height + barRect.anchors.topMargin - height, targetY))
	}

	Rectangle {
		id: barRect

		x: 10 - Lock.Controller.lockSlide * (barRect.width + 10)
		width: parent.width - 15

		anchors {
			top: parent.top
			bottom: parent.bottom
			margins: 10
		}

		color: ShellGlobals.colors.bar
		radius: 5
		border.color: ShellGlobals.colors.barOutline
		border.width: 1

		Item {
			id: containment

			anchors {
				fill: parent
				margins: 5
			}
		}
	}
}
