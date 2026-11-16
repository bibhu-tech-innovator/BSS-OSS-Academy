# fix-asset-paths.ps1
# Updates all HTML files in newly cloned pages to reference local assets
# instead of the live site's _next/static paths

$LocalRoot = $PSScriptRoot
$AssetBase = "_assets"

# Directories containing newly cloned pages that need fixing
$TargetDirs = @(
    "glossary",
    "quiz",
    "reference",
    "ai-use-cases",
    "worked-examples",
    "transformation",
    "about"
)

$fixed = 0
$errors = 0

foreach ($dir in $TargetDirs) {
    $dirPath = Join-Path $LocalRoot $dir
    if (-not (Test-Path $dirPath)) {
        Write-Host "SKIP: $dir (not found)" -ForegroundColor DarkGray
        continue
    }
    
    $htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html" -Recurse -ErrorAction SilentlyContinue
    foreach ($file in $htmlFiles) {
        $relativeDepth = ($file.FullName.Replace($LocalRoot, "").Split("\").Count) - 2
        $assetPrefix = ("../" * $relativeDepth) + $AssetBase
        
        try {
            $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
            $original = $content
            
            # Fix CSS references: /_next/static/chunks/HASH.css?dpl=... -> ../_assets/css/HASH.css
            $content = $content -replace '/_next/static/chunks/([a-f0-9]+)\.css\?dpl=[^"''<>\s\\]+', "$assetPrefix/css/`$1.css"
            $content = $content -replace '/_next/static/chunks/([a-f0-9]+)\.css(?=["''<>\s\\])', "$assetPrefix/css/`$1.css"
            
            # Fix JS references: /_next/static/chunks/HASH.js?dpl=... -> ../_assets/js/HASH.js
            # Handles both hex hashes and turbopack-style names
            $content = $content -replace '/_next/static/chunks/([^"''<>\s\\]+)\.js\?dpl=[^"''<>\s\\]+', "$assetPrefix/js/`$1.js"
            $content = $content -replace '/_next/static/chunks/([^"''<>\s\\]+)\.js(?=["''<>\s\\])', "$assetPrefix/js/`$1.js"
            
            # Fix font references: /_next/static/media/HASH.woff2 -> ../_assets/fonts/HASH.woff2
            # Handles both simple and complex filenames like 797e433ab948586e-s.p.29207c2f.woff2
            $content = $content -replace '/_next/static/media/([^"''<>\s\\]+\.woff2)', "$assetPrefix/fonts/`$1"
            
            # Fix image references: /_next/static/media/HASH.png -> ../_assets/images/HASH.png
            $content = $content -replace '/_next/static/media/([^"''<>\s\\]+\.png)', "$assetPrefix/images/`$1"
            
            # Fix favicon: /favicon.ico -> ../_assets/images/favicon.ico
            $content = $content -replace 'href="/favicon\.ico[^"]*"', "href=""$assetPrefix/images/favicon.ico"""
            
            # Fix trailing backslashes on asset paths (Windows artifact)
            $content = $content -replace '(_assets/[^"''<>\s]+)\\(["''])', '$1$2'
            
            if ($content -ne $original) {
                [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
                $fixed++
                Write-Host "  [FIXED] $($file.FullName.Replace($LocalRoot, ''))" -ForegroundColor Green
            } else {
                Write-Host "  [SKIP]  $($file.FullName.Replace($LocalRoot, '')) (no changes)" -ForegroundColor DarkGray
            }
        } catch {
            $errors++
            Write-Host "  [ERROR] $($file.FullName.Replace($LocalRoot, '')): $_" -ForegroundColor Red
        }
    }
}

Write-Host ""
Write-Host "=== Asset Path Fix Complete ===" -ForegroundColor Cyan
Write-Host "  Fixed: $fixed files" -ForegroundColor Green
Write-Host "  Errors: $errors" -ForegroundColor $(if($errors -gt 0){"Red"}else{"Green"})
