@echo off
echo Script de importaci¢n para sistemas de 32 bits
echo Creado por elstef41 - elstef41.com
echo ----------------------------------
REM Verificar permisos
net session >nul 2>&1
:inicio
if /i "%errorLevel%" GTR "0" (
   echo Necesitas ejecutar el programa como administrador.
   pause
   exit
)
echo Elige si deseas realizar la copia de seguridad o importar una ya existente
echo 1 - Exportar, estoy en Windows 10
echo 2 - Importar, voy a hacer la copia de seguridad al 7
echo 3 - Salir
:ifs
	if /i "%opt%"=="1" (
		mkdir C:\backup
		cd C:\backup
		mkdir PF
		echo "\Common Files">ex.txt
		xcopy "C:\Program Files" "C:\backup\PF" /s /c /e /h /y
		del "C:\backup\PF\Common Files" /F /S /Q
		del "C:\backup\PF\WindowsApps" /F /S /Q
		echo El procedimiento ha finalizado
		pause
		exit
	) else if /i "%opt%"=="2" (
		echo El proceso de restauraci¢n comenzar 
		echo Aseg£rate de
		echo - haber creado un punto de restauraci¢n del sistema, para poder revertir los cambios en caso de falla.
		echo - contar con la carpeta de la copia de seguridad en la ra¡z del disco duro local C:
		pause
		cd C:\backup
		xcopy  "C:\backup\PF" "C:\Program Files" /s /c /e /h /y
		echo Procedimiento finalizado. Ahora se procederá a la limpieza de la copia de seguridad anterior...
		timeout /T 6
		rmdir "C:\Backup\" /S /Q
	echo El procedimiento ha finalizado.
	echo Es probasble que haya quedado la carpeta backup suelta, aunque sin archivos. Si es el caso, puedes eliminarla tranquilamente.
	pause
	exit
	) else if /i "%opt%"=="3" (
		exit
	) else (
		set /p "opt="
		goto ifs
	)                                          
