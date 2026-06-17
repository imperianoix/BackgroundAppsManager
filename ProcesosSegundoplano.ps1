# Inhabilita y habilita procesos en segundo plano Windows 11 - Autor David Mateo Rico G

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"

do {
    Clear-Host

    $apps = Get-ChildItem $registryPath | Sort-Object PSChildName

    Write-Host "===== Aplicaciones en segundo plano =====" -ForegroundColor Green
    Write-Host ""

    for ($i = 0; $i -lt $apps.Count; $i++) {

        $props = Get-ItemProperty $apps[$i].PSPath -ErrorAction SilentlyContinue
        $disabled = ($props.Disabled -eq 1) -or ($props.DisabledByUser -eq 1)

        if ($disabled) {
            Write-Host ("[{0}] {1} - DESHABILITADA" -f ($i + 1), $apps[$i].PSChildName) -ForegroundColor Red
        }
        else {
            Write-Host ("[{0}] {1} - HABILITADA" -f ($i + 1), $apps[$i].PSChildName) -ForegroundColor Green
        }
    }

    Write-Host ""
    Write-Host "[E] Salir" -ForegroundColor Yellow
    Write-Host ""

    $choice = Read-Host "Numero de aplicacion"

    if ($choice -match '^[Ee]$') {
        break
    }

    if ($choice -match '^\d+$') {

        $index = [int]$choice - 1

        if ($index -ge 0 -and $index -lt $apps.Count) {

            $app = $apps[$index]
            $props = Get-ItemProperty $app.PSPath -ErrorAction SilentlyContinue

            $disabled = ($props.Disabled -eq 1) -or ($props.DisabledByUser -eq 1)

            if ($disabled) {

                Remove-ItemProperty -Path $app.PSPath -Name Disabled -ErrorAction SilentlyContinue
                Remove-ItemProperty -Path $app.PSPath -Name DisabledByUser -ErrorAction SilentlyContinue

                Write-Host ""
                Write-Host "HABILITADA: $($app.PSChildName)" -ForegroundColor Green
            }
            else {

                New-ItemProperty -Path $app.PSPath -Name Disabled -Value 1 -PropertyType DWord -Force | Out-Null
                New-ItemProperty -Path $app.PSPath -Name DisabledByUser -Value 1 -PropertyType DWord -Force | Out-Null

                Write-Host ""
                Write-Host "DESHABILITADA: $($app.PSChildName)" -ForegroundColor Red
            }

            Start-Sleep -Seconds 1
        }
    }

} while ($true)