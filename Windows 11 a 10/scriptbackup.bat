@echo off
echo Script de importaci¢n 
echo Creado por elstef41 - elstef41.com
echo ----------------------------------
REM Verificar permisos
net session >nul 2>&1
:inicio
if /i "%errorLevel%" GTR "0" (
   	echo Necesitas ejecutar el programa como administrador.
	goto fin
)
echo ADVERTENCIA: Este script fue creado con prop¢sito de depuraci¢n y no est 
echo dise¤ado para el entorno cotidiano. No hay garant¡as de que puedan surgir
echo errores tras el procedimiento, por lo que se aconseja aplicarlo en entornos
echo virtualizados.
pause
echo --------------------------------------------------------------------------
echo Elige si deseas realizar la copia de seguridad o importar una ya existente
echo 1 - Exportar, estoy en Windows 11
echo 2 - Importar, voy a hacer la copia de seguridad al 10
echo 3 - Salir
:ifs
	if /i "%opt%"=="1" (
		mkdir C:\backup
		cd C:\backup
		mkdir PF
		mkdir PF86
		mkdir Fonts
		echo "\Common Files">ex.txt
		xcopy "C:\Program Files" "C:\backup\PF" /s /c /e /h /y
		xcopy "C:\Program Files (x86)" "C:\backup\PF86" /s /c /e /h /y
		xcopy "C:\Windows\Fonts" "C:\backup\Fonts" /s /c /e /h /y
		del "C:\backup\PF\Common Files" /F /S /Q
		del "C:\backup\PF\WindowsApps" /F /S /Q
		del "C:\backup\PF86\Common Files" /F /S /Q
		echo El procedimiento ha finalizado
		goto fin
	) else if /i "%opt%"=="2" (
		echo El proceso de restauraci¢n comenzar 
		echo Aseg£rate de
		echo - haber creado un punto de restauraci¢n del sistema, para poder revertir los cambios en caso de falla.
		echo - contar con la carpeta de la copia de seguridad en la ra¡z del disco duro local C:
		pause
		cd C:\backup
		xcopy  "C:\backup\PF" "C:\Program Files" /s /c /e /h /y
		xcopy "C:\backup\PF86" "C:\Program Files (x86)" /s /c /e /h /y
		xcopy "C:\backup\Media" "C:\Windows\MediaBackup" /s /c /e /h /y
		xcopy "C:\backup\Fonts" "C:\Windows\Fonts" /s /c /e /h /y /d
		echo Procedimiento finalizado. Ahora se proceder  a la limpieza de la copia de seguridad anterior...
		timeout /T 6
		rmdir "C:\Backup\" /S /Q
	echo El procedimiento ha finalizado.
	echo Es probasble que haya quedado la carpeta backup suelta, aunque sin archivos. Si es el caso, puedes eliminarla tranquilamente.
	goto fin
	) else if /i "%opt%"=="3" (
		exit
	) else (
		set /p "opt="
		goto ifs
	)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
:fin
	echo Presione una tecla para finalizar
	pause>nul
	exit
