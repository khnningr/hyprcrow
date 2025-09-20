import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Notifications

Scope {

    NotificationServer {
        id: notificationServer

        // Solo habilitar lo básico para mostrar notificaciones
        bodySupported: true
        actionsSupported: true
        imageSupported: true
        bodyMarkupSupported: true
        bodyHyperlinksSupported: true
        actionIconsSupported: true
        inlineReplySupported: true
        persistenceSupported: true

        onNotification: function (notification) {
            // Marcar como rastreada para que aparezca en trackedNotifications
            notification.tracked = true;
            console.log("\n« Nueva notificación »", "\nAplicación: ", notification.appName, "\nTítulo del mensaje: ", notification.summary, "\nContenido del mensaje: ", notification.body, "\n");
        }
    }
}
