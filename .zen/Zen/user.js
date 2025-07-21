user_pref("browser.bookmarks.autoExportHTML", true); // Crear un backup de los bookmarks.

// - Firefox
// user_pref("extensions.pocket.enabled", false) // Desabilita Pocket en Firefox.
user_pref("identity.fxaccounts.enabled", false); // Desactiva el apartado de sincronización en el menu y en los Ajustes.

// Seguridad
user_pref("network.trr.uri", "https://dns.quad9.net/dns-query"); // DNS personalizado.
user_pref("browser.contentblocking.category", "custom"); // Protección contra el rastreo mejorada ()
