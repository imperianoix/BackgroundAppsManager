Background Apps Manager - Gestor de aplicaciones en segundo plano

Herramienta para habilitar o deshabilitar aplicaciones de Windows con ejecución en segundo plano mediante las claves de registro ubicadas en:

HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications

Características
Lista todas las aplicaciones registradas.
Muestra el estado actual de cada aplicación (HABILITADA / DESHABILITADA).
Permite alternar el estado de una aplicación escribiendo únicamente su número.
No elimina aplicaciones.
No modifica nombres de claves del registro.
Utiliza los valores Disabled y DisabledByUser.
Opción E para salir de la aplicación.
Requisitos
Windows 10 o Windows 11.
PowerShell.
Permisos de usuario sobre HKCU.
Ejecución
Copie los archivos manage_background_apps.ps1 y Apps segundo plano.bat en el escritorio de Windows.
Ejecute el archivo .bat.
Seleccione el número de la aplicación que desea habilitar o deshabilitar.
Presione E para salir.
Autor

David Mateo Rico Galeano
