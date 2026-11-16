$root = "C:\Users\Nilu\Documents\Bibhu\Vibe Coding_practice\vsscoe_bssoss"

Get-ChildItem -Path $root -Recurse -Filter "*.html" | ForEach-Object {
    $relative = $_.FullName.Substring($root.Length + 1)
    $depth = ($relative.Split('\') | Where-Object { $_ -ne '' }).Count - 1
    
    $prefix = switch ($depth) {
        0 { "" }
        1 { "../" }
        2 { "../../" }
        default { "../" * $depth }
    }
    
    $content = Get-Content -Path $_.FullName -Raw
    $original = $content

    $replacement = 'href="' + $prefix
    $content = $content -replace 'href="/', $replacement

    if ($content -ne $original) {
        Set-Content -Path $_.FullName -Value $content -NoNewline
        Write-Host "  FIXED: $($relative)"
    }
}

Write-Host "`nDone!"
