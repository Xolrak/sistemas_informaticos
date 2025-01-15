<#
.SCRIPT NAME: buscaextension.ps1
.AUTHOR: Carlos Castañeda
.DATE: 18/12/2024

.DESCRIPTION
    - Realizar sumas, restas multiplicaciones, divisiones y potencias
.EXAMPLE
    .\buscaextension.ps1
.NOTES
#>


function Sumar {
    param (
        [double]$a,
        [double]$b
    )
    return [math]::Round($a + $b, 2)
}

function Restar {
    param (
        [double]$a,
        [double]$b
    )
    return [math]::Round($a - $b, 2)
}

function Multiplicar {
    param (
        [double]$a,
        [double]$b
    )
    return [math]::Round($a * $b, 2)
}

function Dividir {
    param (
        [double]$a,
        [double]$b
    )
    if ($b -eq 0) {
        Write-Host "Error: División por cero no permitida"
        return $null
    } else {
        return [math]::Round($a / $b, 2)
    }
}

function Potencia {
    param (
        [double]$a,
        [double]$b
    )
    return [math]::Round([math]::Pow($a, $b), 2)
}

do {
    Clear-Host
    Write-Host "=============================="
    Write-Host "     Calculadora en PowerShell"
    Write-Host "=============================="
    Write-Host "1. Suma"
    Write-Host "2. Resta"
    Write-Host "3. Multiplicación"
    Write-Host "4. División"
    Write-Host "5. Potencia"
    Write-Host "6. Salir"
    Write-Host "=============================="

    $opcion = Read-Host "Introduce tu elección"

    switch ($opcion) {
        1 {
            $a = [double](Read-Host "Introduce el primer número")
            $b = [double](Read-Host "Introduce el segundo número")
            $resultado = Sumar -a $a -b $b
            Write-Host "El resultado de la suma es: $resultado"
        }
        2 {
            $a = [double](Read-Host "Introduce el primer número")
            $b = [double](Read-Host "Introduce el segundo número")
            $resultado = Restar -a $a -b $b
            Write-Host "El resultado de la resta es: $resultado"
        }
        3 {
            $a = [double](Read-Host "Introduce el primer número")
            $b = [double](Read-Host "Introduce el segundo número")
            $resultado = Multiplicar -a $a -b $b
            Write-Host "El resultado de la multiplicación es: $resultado"
        }
        4 {
            $a = [double](Read-Host "Introduce el primer número")
            $b = [double](Read-Host "Introduce el segundo número")
            $resultado = Dividir -a $a -b $b
            if ($resultado -ne $null) {
                Write-Host "El resultado de la división es: $resultado"
            }
        }
        5 {
            $a = [double](Read-Host "Introduce la base")
            $b = [double](Read-Host "Introduce el exponente")
            $resultado = Potencia -a $a -b $b
            Write-Host "El resultado de la potencia es: $resultado"
        }
        6 {
            Write-Host "Saliendo..."
            break
        }
        Default {
            Write-Host "Opción no válida. Por favor, elige una opción del 1 al 6."
        }
    }

    Write-Host "Presiona cualquier tecla para continuar..."
    [void][System.Console]::ReadKey($true)

} while ($true)