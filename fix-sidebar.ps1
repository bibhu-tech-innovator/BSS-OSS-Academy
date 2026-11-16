$root = "C:\Users\Nilu\Documents\Bibhu\Vibe Coding_practice\vsscoe_bssoss"

$moduleData = @(
    @{
        dir = "inventory-activation"; num = 4; color = "amber"; activeClass = "active-amber"
        sections = @(
            @{ file = "inventory-overview.html"; num = "4.1"; title = "Inventory Overview" }
            @{ file = "ems-nms-architecture.html"; num = "4.2"; title = "EMS/NMS Architecture" }
            @{ file = "activation-provisioning.html"; num = "4.3"; title = "Activation &amp; Provisioning" }
            @{ file = "resource-inventory.html"; num = "4.4"; title = "Resource Inventory" }
        )
    }
    @{
        dir = "billing"; num = 5; color = "blue"; activeClass = "active-blue"
        sections = @(
            @{ file = "overview.html"; num = "5.1"; title = "Billing Overview" }
            @{ file = "rating-charging.html"; num = "5.2"; title = "Rating &amp; Charging" }
            @{ file = "mediation.html"; num = "5.3"; title = "Mediation" }
            @{ file = "subscription-billing.html"; num = "5.4"; title = "Subscription Billing" }
            @{ file = "convergent-billing.html"; num = "5.5"; title = "Convergent Billing" }
            @{ file = "revenue-assurance.html"; num = "5.6"; title = "Revenue Assurance" }
            @{ file = "dunning-collections.html"; num = "5.7"; title = "Dunning &amp; Collections" }
            @{ file = "interconnect-roaming.html"; num = "5.8"; title = "Interconnect &amp; Roaming" }
        )
    }
    @{
        dir = "service-assurance"; num = 6; color = "emerald"; activeClass = "active-emerald"
        sections = @(
            @{ file = "overview.html"; num = "6.1"; title = "Service Assurance Overview" }
            @{ file = "fault-management.html"; num = "6.2"; title = "Fault Management Pipeline" }
            @{ file = "l2c-assurance-bridge.html"; num = "6.3"; title = "The L2C-Assurance Bridge" }
            @{ file = "slm-cmdb-integration.html"; num = "6.4"; title = "SLM-CMDB Integration" }
        )
    }
    @{
        dir = "tmf-open-apis"; num = 7; color = "purple"; activeClass = "active-purple"
        sections = @(
            @{ file = "api-introduction.html"; num = "7.1"; title = "API Introduction" }
            @{ file = "api-reference.html"; num = "7.2"; title = "API Reference" }
        )
    }
    @{
        dir = "etom-processes"; num = 8; color = "pink"; activeClass = "active-pink"
        sections = @(
            @{ file = "etom-overview.html"; num = "8.1"; title = "eTOM Overview" }
            @{ file = "oda-framework.html"; num = "8.2"; title = "ODA Framework" }
            @{ file = "lead-to-cash.html"; num = "8.3"; title = "Lead to Cash" }
            @{ file = "process-system-mapping.html"; num = "8.4"; title = "Process-System Mapping" }
            @{ file = "etom-l1-l3-mapping.html"; num = "8.5"; title = "eTOM L1-L3 Mapping" }
        )
    }
    @{
        dir = "vendor-landscape"; num = 9; color = "blue"; activeClass = "active-blue"
        sections = @(
            @{ file = "vendor-overview.html"; num = "9.1"; title = "Vendor Overview" }
            @{ file = "vendor-profiles.html"; num = "9.2"; title = "Vendor Profiles" }
            @{ file = "vendor-comparison.html"; num = "9.3"; title = "Vendor Comparison" }
        )
    }
    @{
        dir = "architecture-comparison"; num = 10; color = "purple"; activeClass = "active-purple"
        sections = @(
            @{ file = "monolith-vs-modular.html"; num = "10.1"; title = "Monolith vs Modular" }
            @{ file = "event-driven-architecture.html"; num = "10.2"; title = "Event-Driven Architecture" }
            @{ file = "migration-coexistence.html"; num = "10.3"; title = "Migration &amp; Coexistence" }
            @{ file = "bff-channel-patterns.html"; num = "10.4"; title = "BFF Channel Patterns" }
        )
    }
    @{
        dir = "orchestration-nfv"; num = 11; color = "amber"; activeClass = "active-amber"
        sections = @(
            @{ file = "cross-domain-orchestration.html"; num = "11.1"; title = "Cross-Domain Orchestration" }
            @{ file = "cross-domain-composition.html"; num = "11.2"; title = "Cross-Domain Composition" }
            @{ file = "domain-integration-pattern.html"; num = "11.3"; title = "Domain Integration Pattern" }
            @{ file = "fixed-access-broadband.html"; num = "11.4"; title = "Fixed Access &amp; Broadband" }
            @{ file = "ip-mpls-transport.html"; num = "11.5"; title = "IP/MPLS Transport" }
            @{ file = "mobile-core-integration.html"; num = "11.6"; title = "Mobile Core Integration" }
            @{ file = "network-orchestrator-variants.html"; num = "11.7"; title = "Network Orchestrator Variants" }
        )
    }
    @{
        dir = "b2b-enterprise"; num = 12; color = "blue"; activeClass = "active-blue"
        sections = @(
            @{ file = "b2b-vs-b2c.html"; num = "12.1"; title = "B2B vs B2C" }
            @{ file = "enterprise-cpq.html"; num = "12.2"; title = "Enterprise CPQ" }
            @{ file = "clm-and-inventory.html"; num = "12.3"; title = "CLM &amp; Inventory" }
        )
    }
)

$mod3Fix = @{
    '3.5' = 'orchestration-domains.html'
    '3.6' = 'slm-installed-base.html'
    '3.7' = 'bpmn-workflows.html'
    '3.8' = 'e2e-data-lineage.html'
    '3.9' = 'simulate-order-workflow.html'
    '3.10' = 'hybrid-com-som.html'
}

# ============================================================
# PART 1: Fix module 3 placeholder href="#" links
# ============================================================
Write-Host "=== Part 1: Fixing module 3 placeholder links ==="

$mod3Dir = Join-Path (Join-Path $root "modules") "com-som-rom"
if (Test-Path $mod3Dir) {
    Get-ChildItem $mod3Dir -Filter "*.html" | ForEach-Object {
        $content = Get-Content $_.FullName -Raw
        $orig = $content

        foreach ($num in $mod3Fix.Keys) {
            $file = $mod3Fix[$num]
            $escapedNum = [regex]::Escape($num)

            $pattern1 = '(href=")#(" class="sidebar-link"><span class="section-num">' + $escapedNum + '</span>)'
            $content = $content -replace $pattern1, ('${1}' + $file + '${2}')

            $pattern2 = '(href=")#(" class="card border-process">\s*<span class="card-num">' + $escapedNum + '</span>)'
            $content = $content -replace $pattern2, ('${1}' + $file + '${2}')
        }

        if ($content -ne $orig) {
            Set-Content -Path $_.FullName -Value $content -NoNewline
            Write-Host "  Fixed: $($_.Name)"
        }
    }
}

# ============================================================
# PART 2: Add section navigation to modules 4-12
# ============================================================
Write-Host "=== Part 2: Adding section navigation to modules 4-12 ==="

foreach ($mod in $moduleData) {
    $dirPath = Join-Path (Join-Path $root "modules") $mod.dir
    if (-not (Test-Path $dirPath)) {
        Write-Host "  Skipping $($mod.dir) (not found)"
        continue
    }

    Get-ChildItem $dirPath -Filter "*.html" | ForEach-Object {
        $content = Get-Content $_.FullName -Raw
        $orig = $content

        if ($content -match '<div class="sidebar-label">Sections</div>') {
            Write-Host "  Skipped (already has sections): $($_.Name)"
            return
        }

        if ($content -notmatch '<div class="sidebar-nav">') {
            return
        }

        $currentFile = $_.Name
        $isIndex = ($currentFile -eq "index.html")

        $sectionsHtml = "`n      <div class=""sidebar-section"">"
        $sectionsHtml += "`n        <div class=""sidebar-label"">Sections</div>"

        foreach ($sec in $mod.sections) {
            $activeClass = ""
            if (-not $isIndex -and $currentFile -eq $sec.file) {
                $activeClass = " " + $mod.activeClass
            }
            $sectionsHtml += "`n        <a href=""$($sec.file)"" class=""sidebar-item$activeClass""><span class=""section-num"">$($sec.num)</span> $($sec.title)</a>"
        }

        $sectionsHtml += "`n      </div>"

        $startPattern = [regex]::Escape('href="../../modules/b2b-enterprise/index.html" class="sidebar-item')
        $fullPattern = "(?s)($startPattern.*?</a>)\s*</div>\s*</div>\s*</nav>"
        $replacementPart = ('${1}' + "`n      </div>`n$sectionsHtml`n    </div>`n  </nav>")
        $content = $content -replace $fullPattern, $replacementPart

        if ($content -ne $orig) {
            Set-Content -Path $_.FullName -Value $content -NoNewline
            Write-Host "  Updated: $($_.Name)"
        }
    }
}

Write-Host "=== Done ==="
