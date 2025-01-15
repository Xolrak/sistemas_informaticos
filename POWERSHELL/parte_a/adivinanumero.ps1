<#
.SCRIPT NAME: adivinanumero.ps1
.AUTHOR: Carlos Castañeda
.DATE: 08/01/2025

.DESCRIPTION
    - Juego de adivinar un número aleatorio
.EXAMPLE
    .\adivinanumero.ps1
.NOTES
    - (Get-Random -Minimum 1 -Maximum 100) genera un número aleatorio entre 1 y 100.
    - (Read-Host "Adivina el número") solicita al usuario que introduzca un número.
    - (while ($numero -ne $numeroAleatorio)) es un bucle que se ejecuta mientras el número introducido no sea igual al número aleatorio.
    - (if ($numero -gt $numeroAleatorio)) comprueba si el número introducido es mayor que el número aleatorio.
    - (if ($numero -lt $numeroAleatorio)) comprueba si el número introducido es menor que el número aleatorio.
    - (else) se ejecuta si ninguna de las condiciones anteriores se cumple.
#>

# Generar un número aleatorio entre 1 y 100
$numeroAleatorio = Get-Random -Minimum 1 -Maximum (100 + 1)

Write-Host "¡Bienvenido al juego de adivinar el número!"
Write-Host "He pensado en un número entre 1 y 100. ¿Puedes adivinar cuál es?"

do {
    # Solicitar al usuario que introduzca un número
    $numero = [int](Read-Host "Adivina el número")

    if ($numero -gt $numeroAleatorio) {
        Write-Host "El número es menor que $numero. Inténtalo de nuevo."
    } elseif ($numero -lt $numeroAleatorio) {
        Write-Host "El número es mayor que $numero. Inténtalo de nuevo."
    } else {
        Write-Host "¡Felicidades! Has adivinado el número $numeroAleatorio."
    }
} while ($numero -ne $numeroAleatorio)