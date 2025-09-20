//@ pragma UseQApplication
// Le dice a Quickshell que utilice QApplication en lugar de Q GUI; esto para el
// correcto comportamiento en administradores de ventana.

import qtQuick // Importa el módulo de qtQuick; para componentes básiocos de QML como Rectangle, Text...
import Quickshell
import "./modules/bar/"

shellroot {
  id: root

}
// 5min
