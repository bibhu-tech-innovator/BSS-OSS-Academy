$root = "C:\Users\Nilu\Documents\Bibhu\Vibe Coding_practice\vsscoe_bssoss"

# ===== MODULE DEFINITIONS =====
$modules = @(
    @{
        num = 1; dir = "foundations"; name = "Foundations"; color = "blue"
        sections = @(
            @{ file = "bss-vs-oss.html"; sec = "1.1"; title = "BSS vs OSS" }
            @{ file = "catalog-driven-architecture.html"; sec = "1.2"; title = "Catalog-Driven Architecture" }
            @{ file = "commercial-vs-technical.html"; sec = "1.3"; title = "Commercial vs Technical Domains" }
            @{ file = "l2c-process-domains.html"; sec = "1.4"; title = "L2C Process Domains" }
        )
    }
    @{
        num = 2; dir = "catalog-modeling"; name = "Catalog Modeling Deep Dive"; color = "emerald"
        sections = @(
            @{ file = "product-offering-specification.html"; sec = "2.1"; title = "Product Offering Specification" }
            @{ file = "cfs-rfs-resource.html"; sec = "2.2"; title = "CFS/RFS &amp; Resource Specs" }
            @{ file = "relationships-decomposition.html"; sec = "2.3"; title = "Relationships &amp; Decomposition" }
            @{ file = "connectivity-example.html"; sec = "2.4"; title = "Connectivity Example" }
        )
    }
    @{
        num = 3; dir = "com-som-rom"; name = "Order Management (COM/SOM/ROM)"; color = "pink"
        sections = @(
            @{ file = "order-management-overview.html"; sec = "3.1"; title = "Order Management Overview" }
            @{ file = "commercial-order-management.html"; sec = "3.2"; title = "Commercial Order Management (COM)" }
            @{ file = "service-order-management.html"; sec = "3.3"; title = "Service Order Management (SOM)" }
            @{ file = "resource-order-management.html"; sec = "3.4"; title = "Resource Order Management (ROM)" }
            @{ file = "orchestration-domains.html"; sec = "3.5"; title = "Orchestration Domains" }
            @{ file = "slm-installed-base.html"; sec = "3.6"; title = "SLM Installed Base" }
            @{ file = "bpmn-workflows.html"; sec = "3.7"; title = "BPMN 2.0 Workflows" }
            @{ file = "e2e-data-lineage.html"; sec = "3.8"; title = "E2E Data Lineage" }
            @{ file = "simulate-order-workflow.html"; sec = "3.9"; title = "Simulate Order Workflow" }
            @{ file = "hybrid-com-som.html"; sec = "3.10"; title = "Hybrid COM/SOM (ACL)" }
        )
    }
    @{
        num = 4; dir = "inventory-activation"; name = "Network Inventory &amp; Activation"; color = "amber"
        sections = @(
            @{ file = "inventory-overview.html"; sec = "4.1"; title = "Inventory Overview" }
            @{ file = "ems-nms-architecture.html"; sec = "4.2"; title = "EMS/NMS Architecture" }
            @{ file = "activation-provisioning.html"; sec = "4.3"; title = "Activation &amp; Provisioning" }
            @{ file = "resource-inventory.html"; sec = "4.4"; title = "Resource Inventory" }
        )
    }
    @{
        num = 5; dir = "billing"; name = "Billing &amp; Revenue Management"; color = "blue"
        sections = @(
            @{ file = "overview.html"; sec = "5.1"; title = "Billing Overview" }
            @{ file = "rating-charging.html"; sec = "5.2"; title = "Rating &amp; Charging" }
            @{ file = "mediation.html"; sec = "5.3"; title = "Mediation" }
            @{ file = "subscription-billing.html"; sec = "5.4"; title = "Subscription Billing" }
            @{ file = "convergent-billing.html"; sec = "5.5"; title = "Convergent Billing" }
            @{ file = "revenue-assurance.html"; sec = "5.6"; title = "Revenue Assurance" }
            @{ file = "dunning-collections.html"; sec = "5.7"; title = "Dunning &amp; Collections" }
            @{ file = "interconnect-roaming.html"; sec = "5.8"; title = "Interconnect &amp; Roaming" }
        )
    }
    @{
        num = 6; dir = "service-assurance"; name = "Service Assurance"; color = "emerald"
        sections = @(
            @{ file = "overview.html"; sec = "6.1"; title = "Service Assurance Overview" }
            @{ file = "fault-management.html"; sec = "6.2"; title = "Fault Management Pipeline" }
            @{ file = "l2c-assurance-bridge.html"; sec = "6.3"; title = "The L2C-Assurance Bridge" }
            @{ file = "slm-cmdb-integration.html"; sec = "6.4"; title = "SLM-CMDB Integration" }
        )
    }
    @{
        num = 7; dir = "tmf-open-apis"; name = "TM Forum Open APIs"; color = "purple"
        sections = @(
            @{ file = "api-introduction.html"; sec = "7.1"; title = "API Introduction" }
            @{ file = "api-reference.html"; sec = "7.2"; title = "API Reference" }
        )
    }
    @{
        num = 8; dir = "etom-processes"; name = "TM Forum Frameworks (eTOM/ODA)"; color = "pink"
        sections = @(
            @{ file = "etom-overview.html"; sec = "8.1"; title = "eTOM Overview" }
            @{ file = "oda-framework.html"; sec = "8.2"; title = "ODA Framework" }
            @{ file = "lead-to-cash.html"; sec = "8.3"; title = "Lead to Cash" }
            @{ file = "process-system-mapping.html"; sec = "8.4"; title = "Process-System Mapping" }
            @{ file = "etom-l1-l3-mapping.html"; sec = "8.5"; title = "eTOM L1-L3 Mapping" }
        )
    }
    @{
        num = 9; dir = "vendor-landscape"; name = "Vendor Landscape"; color = "blue"
        sections = @(
            @{ file = "vendor-overview.html"; sec = "9.1"; title = "Vendor Overview" }
            @{ file = "vendor-profiles.html"; sec = "9.2"; title = "Vendor Profiles" }
            @{ file = "vendor-comparison.html"; sec = "9.3"; title = "Vendor Comparison" }
        )
    }
    @{
        num = 10; dir = "architecture-comparison"; name = "Architecture Patterns"; color = "purple"
        sections = @(
            @{ file = "monolith-vs-modular.html"; sec = "10.1"; title = "Monolith vs Modular" }
            @{ file = "event-driven-architecture.html"; sec = "10.2"; title = "Event-Driven Architecture" }
            @{ file = "migration-coexistence.html"; sec = "10.3"; title = "Migration &amp; Coexistence" }
            @{ file = "bff-channel-patterns.html"; sec = "10.4"; title = "BFF Channel Patterns" }
        )
    }
    @{
        num = 11; dir = "orchestration-nfv"; name = "Multi-Domain Orchestration"; color = "amber"
        sections = @(
            @{ file = "cross-domain-orchestration.html"; sec = "11.1"; title = "Cross-Domain Orchestration" }
            @{ file = "cross-domain-composition.html"; sec = "11.2"; title = "Cross-Domain Composition" }
            @{ file = "domain-integration-pattern.html"; sec = "11.3"; title = "Domain Integration Pattern" }
            @{ file = "fixed-access-broadband.html"; sec = "11.4"; title = "Fixed Access &amp; Broadband" }
            @{ file = "ip-mpls-transport.html"; sec = "11.5"; title = "IP/MPLS Transport" }
            @{ file = "mobile-core-integration.html"; sec = "11.6"; title = "Mobile Core Integration" }
            @{ file = "network-orchestrator-variants.html"; sec = "11.7"; title = "Network Orchestrator Variants" }
        )
    }
    @{
        num = 12; dir = "b2b-enterprise"; name = "B2B Enterprise BSS"; color = "blue"
        sections = @(
            @{ file = "b2b-vs-b2c.html"; sec = "12.1"; title = "B2B vs B2C" }
            @{ file = "enterprise-cpq.html"; sec = "12.2"; title = "Enterprise CPQ" }
            @{ file = "clm-and-inventory.html"; sec = "12.3"; title = "CLM &amp; Inventory" }
        )
    }
)

# Build a lookup from "dir/file" -> section object
$sectionLookup = @{}
foreach ($mod in $modules) {
    foreach ($sec in $mod.sections) {
        $key = "$($mod.dir)/$($sec.file)"
        $sectionLookup[$key] = $sec
    }
}

# ===== ACCORDION CSS =====
$accordionCss = @"
details.sidebar-module { margin-bottom: 0; border: none; background: none; }
summary.sidebar-module-header { 
  display: flex; align-items: center; gap: 0.5rem;
  padding: 0.5rem 0.75rem; cursor: pointer;
  font-size: 0.8125rem; font-weight: 500; color: #94a3b8;
  list-style: none; user-select: none;
}
summary.sidebar-module-header::-webkit-details-marker { display: none; }
summary.sidebar-module-header::marker { display: none; content: ''; }
summary.sidebar-module-header:hover { background: rgba(255,255,255,0.04); color: #e2e8f0; }
details.sidebar-module[open] > summary.sidebar-module-header { background: rgba(255,255,255,0.04); color: #e2e8f0; }
.sidebar-module-sections { padding-left: 0.5rem; }
.sidebar-section-link {
  display: flex; align-items: center; gap: 0.375rem;
  padding: 0.35rem 0.5rem; border-radius: 0.25rem;
  font-size: 0.75rem; font-weight: 400; color: #64748b;
  border-left: 2px solid transparent; transition: all 0.15s;
  margin-bottom: 1px; text-decoration: none;
}
.sidebar-section-link:hover { color: #94a3b8; background: rgba(255,255,255,0.03); }
.sidebar-section-link.active-blue { color: #93c5fd; border-left-color: #3b82f6; background: rgba(59,130,246,0.08); }
.sidebar-section-link.active-emerald { color: #6ee7b7; border-left-color: #10b981; background: rgba(16,185,129,0.08); }
.sidebar-section-link.active-pink { color: #f9a8d4; border-left-color: #ec4899; background: rgba(236,72,153,0.08); }
.sidebar-section-link.active-amber { color: #fcd34d; border-left-color: #f59e0b; background: rgba(245,158,11,0.08); }
.sidebar-section-link.active-purple { color: #c4b5fd; border-left-color: #8b5cf6; background: rgba(139,92,246,0.08); }
.sidebar-section-link .section-num { font-size: 0.65rem; color: #64748b; min-width: 1.8rem; }
details.sidebar-module[open] > summary.sidebar-module-header .num { opacity: 1; }
"@

# ===== HELPER: Generate sidebar HTML =====
function Get-SidebarHtml {
    param($modules, $currentModuleNum, $currentSectionFile, $prefix, $depth, $isModuleIndex)

    $lines = [System.Collections.ArrayList]::new()

    if ($depth -eq 2) {
        $mod = $modules | Where-Object { $_.num -eq $currentModuleNum } | Select-Object -First 1
        $modName = if ($mod) { $mod.name } else { "" }
        [void]$lines.Add('<nav class="sidebar" id="sidebar">')
        [void]$lines.Add("  <div class=`"sidebar-header`"><a href=`"${prefix}index.html`">BSS/OSS Academy</a><small>$modName</small></div>")
    } else {
        [void]$lines.Add('<nav class="sidebar" id="sidebar">')
        [void]$lines.Add("  <div class=`"sidebar-header`"><a href=`"${prefix}index.html`">BSS/OSS Academy</a></div>")
    }

    [void]$lines.Add('  <div class="sidebar-nav">')

    foreach ($mod in $modules) {
        $openAttr = ""
        if ($mod.num -eq $currentModuleNum -and $depth -eq 2) {
            $openAttr = " open"
        }
        [void]$lines.Add("    <details class=`"sidebar-module`"$openAttr>")
        [void]$lines.Add("      <summary class=`"sidebar-module-header`">")
        [void]$lines.Add("        <span class=`"num num-$($mod.color)`">$($mod.num)</span>")
        [void]$lines.Add("        <span>$($mod.name)</span>")
        [void]$lines.Add("      </summary>")
        [void]$lines.Add('      <div class="sidebar-module-sections">')

        foreach ($sec in $mod.sections) {
            $href = "${prefix}modules/$($mod.dir)/$($sec.file)"
            $activeClass = ""
            if ($mod.num -eq $currentModuleNum -and $sec.file -eq $currentSectionFile -and -not $isModuleIndex) {
                $activeClass = " active-$($mod.color)"
            }
            [void]$lines.Add("        <a href=`"$href`" class=`"sidebar-section-link$activeClass`">")
            [void]$lines.Add("          <span class=`"section-num`">$($sec.sec)</span> $($sec.title)")
            [void]$lines.Add("        </a>")
        }

        [void]$lines.Add('      </div>')
        [void]$lines.Add('    </details>')
    }

    [void]$lines.Add('  </div>')
    [void]$lines.Add('</nav>')

    return $lines -join "`n"
}

# ===== HELPER: Add mobile toggle HTML if missing =====
function Get-MobileToggleHtml {
    return @"
<div class="sidebar-overlay" id="overlay" onclick="toggleSidebar()"></div>
<button class="mobile-toggle" onclick="toggleSidebar()" aria-label="Toggle navigation">☰</button>
"@
}

# ===== HELPER: Add toggle script if missing =====
$toggleScript = @"
function toggleSidebar() {
  document.getElementById('sidebar').classList.toggle('open');
  document.getElementById('overlay').classList.toggle('open');
}
"@

# ===== PROCESS EACH HTML FILE =====
$files = Get-ChildItem -Path $root -Filter "*.html" -Recurse
$total = $files.Count
$processed = 0
$errors = 0

Write-Host "Processing $total HTML files..."

foreach ($file in $files) {
    $relPath = $file.FullName.Substring($root.Length + 1)
    $parts = $relPath -split '\\'
    $depth = $parts.Length - 1
    $fileName = $parts[-1]

    # Determine module context
    $currentModuleNum = 0
    $currentSectionFile = ""
    $isModuleIndex = $false
    $prefix = ""

    if ($depth -eq 0) {
        $prefix = ""
    } elseif ($depth -eq 1) {
        $prefix = "../"
    } elseif ($depth -eq 2) {
        $prefix = "../../"
        $moduleDir = $parts[-2]
        $matchingMod = $modules | Where-Object { $_.dir -eq $moduleDir } | Select-Object -First 1
        if ($matchingMod) {
            $currentModuleNum = $matchingMod.num
            if ($fileName -eq "index.html") {
                $isModuleIndex = $true
            } else {
                $lookupKey = "$moduleDir/$fileName"
                $matchedSec = $sectionLookup[$lookupKey]
                if ($matchedSec) {
                    $currentSectionFile = $matchedSec.file
                }
            }
        }
    }

    # Generate new sidebar
    $newSidebar = Get-SidebarHtml -modules $modules -currentModuleNum $currentModuleNum -currentSectionFile $currentSectionFile -prefix $prefix -depth $depth -isModuleIndex $isModuleIndex

    Write-Host "  [$depth] $relPath (module=$currentModuleNum, section=$currentSectionFile)"

    try {
        $content = Get-Content -Path $file.FullName -Raw
        $originalContent = $content

        # ----- Replace existing sidebar -----
        # Match either <nav class="sidebar" ...> ... </nav> or <aside class="sidebar" ...> ... </aside>
        $sidebarMatch = [regex]::Match($content, '<(nav|aside)\s+class="sidebar"[^>]*>[\s\S]*?</\1>')
        if ($sidebarMatch.Success) {
            $content = $content.Remove($sidebarMatch.Index, $sidebarMatch.Length)
            $content = $content.Insert($sidebarMatch.Index, $newSidebar)
        } else {
            # No existing sidebar found - insert after <body> tag for depth 0 or depth 1
            if ($depth -eq 0 -or $depth -eq 1) {
                # Insert sidebar after <body> tag
                $bodyMatch = [regex]::Match($content, '<body[^>]*>')
                if ($bodyMatch.Success) {
                    $insertPos = $bodyMatch.Index + $bodyMatch.Length
                    $toggleHtml = Get-MobileToggleHtml
                    $content = $content.Insert($insertPos, "`n  $toggleHtml`n  $newSidebar`n")
                }
            }
        }

        # ----- Add mobile overlay/toggle if missing -----
        if ($depth -gt 0 -and $content -notmatch 'class="sidebar-overlay"') {
            # Insert overlay and toggle after <body> tag
            $bodyMatch = [regex]::Match($content, '<body[^>]*>')
            if ($bodyMatch.Success) {
                $insertPos = $bodyMatch.Index + $bodyMatch.Length
                $toggleHtml = Get-MobileToggleHtml
                $content = $content.Insert($insertPos, "`n  $toggleHtml")
            }
        }

        # ----- Add toggleSidebar script if missing -----
        if ($depth -gt 0 -and $content -notmatch 'function toggleSidebar') {
            $scriptTag = "`n<script>`n$toggleScript`n</script>"
            $content = $content -replace '</body>', "$scriptTag`n</body>"
        }

        # ----- Add accordion CSS to <style> block (only if not already present) -----
        if ($content -match '</style>' -and $content -notmatch 'summary\.sidebar-module-header::-webkit-details-marker') {
            $content = $content -replace '</style>', "$accordionCss`n</style>"
        }

        # Write back if changed
        if ($content -ne $originalContent) {
            Set-Content -Path $file.FullName -Value $content -NoNewline
            $processed++
        } else {
            Write-Host "    (no changes needed)"
        }
    } catch {
        Write-Host "    ERROR: $_"
        $errors++
    }
}

Write-Host "`nDone! Processed $processed files (${errors} errors)."
