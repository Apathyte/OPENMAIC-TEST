[CmdletBinding()]
param(
    [string]$RuntimeRoot = (Join-Path (Split-Path $PSScriptRoot -Parent) ".pilot-runtime")
)

$ErrorActionPreference = "Stop"
$upstreamUrl = "https://github.com/THU-MAIC/OpenMAIC.git"
$upstreamTag = "v1.0.0"
$openMaicPath = Join-Path $RuntimeRoot "OpenMAIC"

function Require-Command {
    param([string]$Name)

    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Required command '$Name' was not found on PATH."
    }
}

Require-Command "git"
Require-Command "node"
Require-Command "corepack"

$nodeVersionText = (& node --version).Trim().TrimStart("v")
$nodeVersion = [version]$nodeVersionText
if ($nodeVersion -lt [version]"20.9.0") {
    throw "OpenMAIC v1.0.0 requires Node.js 20.9.0 or newer. Found $nodeVersionText."
}

if (Test-Path $openMaicPath) {
    throw "Runtime path already exists: $openMaicPath. Remove or rename it deliberately before retrying."
}

New-Item -ItemType Directory -Path $RuntimeRoot -Force | Out-Null
& git clone --branch $upstreamTag --depth 1 $upstreamUrl $openMaicPath

Push-Location $openMaicPath
try {
    & corepack enable
    & corepack prepare pnpm@10.28.0 --activate
    & pnpm.cmd install

    if (-not (Test-Path ".env.local")) {
        Copy-Item ".env.example" ".env.local"
    }

    $resolvedCommit = (& git rev-parse HEAD).Trim()
    Write-Host "OpenMAIC $upstreamTag is ready at $openMaicPath"
    Write-Host "Resolved upstream commit: $resolvedCommit"
    Write-Host "Next: edit .env.local, then run 'pnpm.cmd dev' from this directory."
}
finally {
    Pop-Location
}
