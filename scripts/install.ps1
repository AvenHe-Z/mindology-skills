# Install the mindology skill pack into an AI agent's skills directory (Windows).
#
# Usage (PowerShell):
#   powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Target "$env:USERPROFILE\.agents\skills"
#
# Examples of -Target:
#   "$env:USERPROFILE\.agents\skills"     # Codex CLI
#   "$env:USERPROFILE\.claude\skills"     # Claude Code
#   "$env:USERPROFILE\.workbuddy\skills"  # WorkBuddy
#
# The script flattens the pack: the router becomes <Target>\mindology and each
# of the 28 member skills becomes a direct child <Target>\<slug>.

param(
    [Parameter(Mandatory = $true)]
    [string]$Target
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$Src = Join-Path $RepoRoot "mindology"

if (-not (Test-Path (Join-Path $Src "SKILL.md"))) {
    Write-Error "Cannot find $Src\SKILL.md. Clone the repo and run from the repo root."
    exit 1
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null

# 1) router skill
$routerDst = Join-Path $Target "mindology"
New-Item -ItemType Directory -Force -Path $routerDst | Out-Null
Copy-Item (Join-Path $Src "SKILL.md") (Join-Path $routerDst "SKILL.md") -Force
$meta = Join-Path $Src "_meta.json"
if (Test-Path $meta) {
    Copy-Item $meta (Join-Path $routerDst "_meta.json") -Force
}

# 2) 28 member skills
$count = 0
Get-ChildItem -Path $Src -Directory | ForEach-Object {
    $dest = Join-Path $Target $_.Name
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    Copy-Item $_.FullName $dest -Recurse -Force
    $count++
}

Write-Host "Done: installed 1 router + $count member skills -> $Target"
Write-Host "Next: restart/reload your AI agent, then ask a mindology question (e.g. about mind maturity)."
