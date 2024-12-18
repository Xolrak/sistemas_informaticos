<#
.SCRIPT NAME: limpia.ps1
.AUTHOR: Carlos Castañeda
.DATE: 18/12/2024

.DESCRIPTION
    - Busca ficheros con una extensión concreta y los mueve a Descargas
    - Se pregunta al usuario si quiere eliminar los archivos
.EXAMPLE
    .\limpia.ps1 -Extension pdf
.NOTES
    - ($Extension.StartsWith(".")) comprueba si la variable string empieza con ".".
    - ($PSScriptRoot) es una variable que determina cual es el directorio donde se ejecuta el script.
    - (Get-ChildItem -Path $PSScriptRoot -Filter $extension -File):
        + Get-ChildItem: Lista elementos (tanto archivos como carpetas) en una ubicación especifica.
        + Filter: Aplica un filtro.
        + File: Especifica que solo se listaran archivos.
    - (Join-Path -Path $descargas -ChildPath $archivo.Name):
        + Join-Path: Combina dos partes de una ruta para crear una ruta completa
        + Path: Especifica la ruta base del directorio completo
        + ChildPath: Especifica el nombre del archivo para obtener la ruta completa
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$Extension
)

Clear-Host
if (-not $Extension.StartsWith(".")) {
    $extension = "*." + $Extension
}
$extension = "*" + $Extension
$archivos = Get-ChildItem -Path $PSScriptRoot -Filter $extension -File
if ($archivos.Count -eq 0) {
    Write-Host "No hay archivos con esta extensión en este directorio"
    exit
}
$descargas = "$env:USERPROFILE\Downloads"
foreach ($archivo in $archivos) {
    Move-Item -Path $archivo.FullName -Destination $descargas
    Write-Host "Se ha movido: $($archivo.Name)" -ForegroundColor Green
}

[string]$borrar = Read-Host "¿Quieres borrar estos archivos del directorio Descargas? (y/n)"
if ($borrar.ToUpper() -eq "Y") {
    foreach ($archivo in $archivos) {
        $archivoEnDestino = Join-Path -Path $descargas -ChildPath $archivo.Name
        if (Test-Path -Path $archivoEnDestino) {
            Remove-Item -Path $archivoEnDestino -Force
            Write-Host "Archivo eliminado: $($archivo.Name)" -ForegroundColor Red
        }
    }
    Write-Host "Todos los archivos movidos han sido eliminados" -ForegroundColor DarkRed
} elseif ($borrar.ToUpper() -eq "N") {
    Write-host "Los archivos movidos se mantendrán en $descargas" -ForegroundColor Blue
} else {
    Write-Host "Opción no válida. Los archivos se mantendrán en $descargas" -ForegroundColor Yellow
}