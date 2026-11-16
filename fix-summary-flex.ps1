$htmlFiles = Get-ChildItem -Recurse -Filter "*.html" | Where-Object { $_.FullName -notmatch '\\node_modules\\' }

$oldCss = "summary.sidebar-module-header { 
  display: flex; align-items: center; gap: 0.5rem;
  padding: 0.5rem 0.75rem; cursor: pointer;
  font-size: 0.8125rem; font-weight: 500; color: #94a3b8;
  list-style: none; user-select: none;
}"

$newCss = "summary.sidebar-module-header { padding: 0.5rem 0.75rem; cursor: pointer; font-size: 0.8125rem; font-weight: 500; color: #94a3b8; list-style: none; user-select: none; }
.sidebar-module-header-inner { display: flex; align-items: center; gap: 0.5rem; }"

$count = 0
foreach ($file in $htmlFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    
    # Fix CSS: remove display:flex from summary, add inner class
    $content = $content -replace [regex]::Escape($oldCss), $newCss
    
    # Fix HTML: wrap summary content in inner div
    $content = $content -replace '<summary class="sidebar-module-header">', '<summary class="sidebar-module-header"><div class="sidebar-module-header-inner">'
    $content = $content -replace '</summary>', '</div></summary>'
    
    Set-Content -LiteralPath $file.FullName -Value $content -NoNewline
    $count++
}

Write-Host "Fixed $count files"
