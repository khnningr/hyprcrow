//@ pragma UseQApplication
// to the top of your root QML file and restart quickshell.

import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland

// Módulos
import qs.Modules.StatusBar
import qs.Modules.Wallpaper

import qs.Test // Así es como se importa un modulo; sintaxis: 'import qs.<dir/al/modulo> [as <Namespace>]'
import qs.Test.ReutilizarCodigo
import qs.Test.Workspace
import qs.Test.QtObject

ShellRoot {

    //TestAppLauncher {}
    //TestNotificationServer {}
    //TestNotification {}
    //TestWorkspacesNumber {}
    //Workspaces {}
    //TestWorkspacesIcon {}
    //
    //
    //ReutilizarCodigo {}
    //WindowManager {}
    //
    //Workspace {}

    //TestNotidications {}
    // TestButton {}
    // TestCheckBox {}
    // TestComboBox {}
    // TestRepeater {}
    // TestRowLayout {}
    //
    //TestQtObject {}

    // TestLabel {} // Label con 'Hola mundo'

    //
    // Modulos
    Bar {}
    Wallpaper {}
}
