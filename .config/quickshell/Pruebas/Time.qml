pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
