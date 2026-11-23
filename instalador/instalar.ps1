# Instala a Calculadora modificada (porcentagem na subtração).
# Execute no PowerShell COMO ADMINISTRADOR, dentro desta pasta:
#   powershell -ExecutionPolicy Bypass -File .\instalar.ps1
#requires -RunAsAdministrator
$ErrorActionPreference = 'Stop'
$aqui = $PSScriptRoot

$bundle = Get-ChildItem -Path "$aqui\pacote" -Filter '*.msixbundle' | Select-Object -First 1
if (-not $bundle) { throw "Não encontrei o arquivo .msixbundle na pasta 'pacote'." }

Write-Host "1/2 Assinando o pacote com um certificado de teste local..."
& "$aqui\SignTestApp.ps1" -AppToSign $bundle.FullName

Write-Host "2/2 Instalando..."
& "$aqui\pacote\Add-AppDevPackage.ps1" -Force

Write-Host ""
Write-Host "Pronto! Procure 'Calculator [Dev]' no Menu Iniciar."
