$vaultPath = "D:\obsidian_vaults\Ghosts of Saltmarsh"
$contentPath = ".\content"
# $preserveFile = "index.md"

Write-Host "Syncing Vault (preserving index.md)..."

# Создаём папку если нет
if (!(Test-Path $contentPath)) {
    New-Item -ItemType Directory -Path $contentPath | Out-Null
}

# Зеркалим Vault в content,
# исключая index.md, .obsidian и .git
robocopy $vaultPath $contentPath /MIR `
    /XF $preserveFile `
    /XD ".obsidian" ".git"

if ($LASTEXITCODE -gt 3) {
    Write-Error "Sync failed"
    exit 1
}

Write-Host "Build Quartz..."
npx quartz build --serve