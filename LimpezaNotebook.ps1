# ===============================================
# Script: LimpezaNotebook.ps1
# Objetivo: Automatizar limpezas básicas de PC/Notebook Windows
# Autor: Juarez Maciel
# ===============================================

# --- 1️ Limpeza de pastas temporárias ---
Write-Output "Iniciando limpeza de arquivos temporários..."

# Pastas a serem limpas
$pastas = @(
    "$env:APPDATA\Microsoft\Windows\Recent",
    "$env:windir\Prefetch",
    "$env:windir\Temp",
    "$env:TEMP"
)

foreach ($pasta in $pastas) {
    if (Test-Path $pasta) {
        Write-Output "Limpando: $pasta"
        Get-ChildItem -Path $pasta -Recurse -Force -ErrorAction SilentlyContinue | 
            Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
    }
}

Write-Output "Limpeza de arquivos temporários concluída."

# --- 2️ Limpeza de disco (Cleanmgr) ---
Write-Output "Iniciando limpeza de disco..."

# Configuração automática: execute manualmente uma vez:
# cleanmgr /sageset:1  (marque todas as opções desejadas)
# Depois o script abaixo rodará a limpeza automaticamente
Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait

Write-Output "Limpeza de disco concluída."

# --- 3️ Otimizações visuais (desativar animações) ---
Write-Output "Aplicando otimizações visuais..."

# Desativa animações para melhorar desempenho
$perfKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
if (!(Test-Path $perfKey)) {
    New-Item -Path $perfKey -Force | Out-Null
}
Set-ItemProperty -Path $perfKey -Name "VisualFXSetting" -Value 2

Write-Output "Otimizações visuais aplicadas."

# --- 4️⃣ Finalização ---
Write-Output "Limpeza básica concluída com sucesso! 😎"
Write-Output "Reinicie seu computador para aplicar algumas alterações, se necessário."
