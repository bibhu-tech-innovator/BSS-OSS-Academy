# clone-missing-pages.ps1
# Clones all missing pages from bssoss-academy.dev into the local clone
# Saves raw HTML to preserve all diagrams, tables, SVGs, and interactive elements

$BaseUrl = "https://bssoss-academy.dev"
$OutputRoot = $PSScriptRoot

function Fetch-AndSave {
    param(
        [string]$Url,
        [string]$OutPath,
        [string]$Label
    )
    
    $dir = Split-Path $OutPath -Parent
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    
    try {
        $response = Invoke-WebRequest -Uri $Url -UseBasicParsing -TimeoutSec 60 -MaximumRedirection 5
        if ($response.StatusCode -eq 200) {
            [System.IO.File]::WriteAllText($OutPath, $response.Content, [System.Text.Encoding]::UTF8)
            $size = [math]::Round($response.Content.Length / 1024, 1)
            Write-Host "  [OK] $Label -> $OutPath ($size KB)" -ForegroundColor Green
            return $true
        } else {
            Write-Host "  [FAIL] $Label - Status $($response.StatusCode)" -ForegroundColor Red
            return $false
        }
    } catch {
        Write-Host "  [ERROR] $Label - $_" -ForegroundColor Red
        return $false
    }
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  BSS/OSS Academy - Complete Page Cloner" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$success = 0
$failed = 0

# === TOP-LEVEL PAGES ===
Write-Host "--- Top-Level Pages ---" -ForegroundColor Yellow

$topPages = @(
    @{ Url = "/glossary"; Out = "glossary\index.html"; Label = "Glossary" },
    @{ Url = "/quiz"; Out = "quiz\index.html"; Label = "Quiz" },
    @{ Url = "/quiz/labs/stack-builder"; Out = "quiz\labs\stack-builder.html"; Label = "Stack Builder Lab" },
    @{ Url = "/reference"; Out = "reference\index.html"; Label = "Reference Views" },
    @{ Url = "/ai-use-cases"; Out = "ai-use-cases\index.html"; Label = "AI Use-Cases" },
    @{ Url = "/worked-examples"; Out = "worked-examples\index.html"; Label = "Domain Examples" },
    @{ Url = "/transformation"; Out = "transformation\index.html"; Label = "Transformation Planning" },
    @{ Url = "/about"; Out = "about\index.html"; Label = "About" }
)

foreach ($p in $topPages) {
    $result = Fetch-AndSave -Url "$BaseUrl$($p.Url)" -OutPath (Join-Path $OutputRoot $p.Out) -Label $p.Label
    if ($result) { $success++ } else { $failed++ }
    Start-Sleep -Milliseconds 300
}

# === TRANSFORMATION SUB-PAGES ===
Write-Host ""
Write-Host "--- Transformation Sub-Pages ---" -ForegroundColor Yellow

$transformPages = @(
    @{ Url = "/transformation/readiness"; Out = "transformation\readiness.html"; Label = "Readiness" },
    @{ Url = "/transformation/simulator"; Out = "transformation\simulator.html"; Label = "Simulator" },
    @{ Url = "/transformation/anti-patterns"; Out = "transformation\anti-patterns.html"; Label = "Anti-Patterns" }
)

foreach ($p in $transformPages) {
    $result = Fetch-AndSave -Url "$BaseUrl$($p.Url)" -OutPath (Join-Path $OutputRoot $p.Out) -Label $p.Label
    if ($result) { $success++ } else { $failed++ }
    Start-Sleep -Milliseconds 300
}

# === WORKED EXAMPLES - B2B ===
Write-Host ""
Write-Host "--- Worked Examples: B2B ---" -ForegroundColor Yellow

$b2bPages = @(
    @{ Url = "/worked-examples/network-domains"; Out = "worked-examples\network-domains.html"; Label = "Network Domains" },
    @{ Url = "/worked-examples/satellite-new-activation"; Out = "worked-examples\satellite-new-activation.html"; Label = "Satellite Activation" },
    @{ Url = "/worked-examples/enterprise-vpn"; Out = "worked-examples\enterprise-vpn.html"; Label = "Enterprise VPN" },
    @{ Url = "/worked-examples/enterprise-sdwan"; Out = "worked-examples\enterprise-sdwan.html"; Label = "Enterprise SD-WAN" },
    @{ Url = "/worked-examples/sip-trunk"; Out = "worked-examples\sip-trunk.html"; Label = "SIP Trunk" },
    @{ Url = "/worked-examples/iot-m2m-connectivity"; Out = "worked-examples\iot-m2m-connectivity.html"; Label = "IoT/M2M" },
    @{ Url = "/worked-examples/enterprise-5g-slice"; Out = "worked-examples\enterprise-5g-slice.html"; Label = "5G Network Slice" }
)

foreach ($p in $b2bPages) {
    $result = Fetch-AndSave -Url "$BaseUrl$($p.Url)" -OutPath (Join-Path $OutputRoot $p.Out) -Label $p.Label
    if ($result) { $success++ } else { $failed++ }
    Start-Sleep -Milliseconds 300
}

# === WORKED EXAMPLES - B2C ===
Write-Host ""
Write-Host "--- Worked Examples: B2C ---" -ForegroundColor Yellow

$b2cPages = @(
    @{ Url = "/worked-examples/mobile-sim-activation"; Out = "worked-examples\mobile-sim-activation.html"; Label = "Mobile SIM Activation" },
    @{ Url = "/worked-examples/broadband-internet"; Out = "worked-examples\broadband-internet.html"; Label = "Broadband Internet" },
    @{ Url = "/worked-examples/fba-fixed-wireless"; Out = "worked-examples\fba-fixed-wireless.html"; Label = "Fixed Wireless Access" },
    @{ Url = "/worked-examples/iptv-triple-play"; Out = "worked-examples\iptv-triple-play.html"; Label = "IPTV Triple-Play" },
    @{ Url = "/worked-examples/vod-streaming"; Out = "worked-examples\vod-streaming.html"; Label = "VOD Streaming" },
    @{ Url = "/worked-examples/mobile-money"; Out = "worked-examples\mobile-money.html"; Label = "Mobile Money" }
)

foreach ($p in $b2cPages) {
    $result = Fetch-AndSave -Url "$BaseUrl$($p.Url)" -OutPath (Join-Path $OutputRoot $p.Out) -Label $p.Label
    if ($result) { $success++ } else { $failed++ }
    Start-Sleep -Milliseconds 300
}

# === SUMMARY ===
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Clone Complete" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Success: $success" -ForegroundColor Green
Write-Host "  Failed:  $failed" -ForegroundColor $(if($failed -gt 0){"Red"}else{"Green"})
Write-Host "  Total:   $($success + $failed)" -ForegroundColor White
Write-Host ""
if ($failed -gt 0) {
    Write-Host "  Some pages failed to clone. Check errors above." -ForegroundColor Yellow
}
Write-Host "  Note: These pages use live site CSS/JS and need internet to render." -ForegroundColor DarkGray
Write-Host "  For full offline clone, use HTTrack: winget install HTTrack" -ForegroundColor DarkGray
