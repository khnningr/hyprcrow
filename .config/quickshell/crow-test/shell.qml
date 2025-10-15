//@ pragma Env QT_QPA_PLATFORMTHEME=gtk3
import Quickshell
import Quickshell.Io
import qs.Modules.StatusBar
import qs.Modules.Hyprshot

ShellRoot {
    StatusBar {
        id: statusBar
    }

    //
    //
    //
    // bar: statusBar
    Hyprshot {}

}
