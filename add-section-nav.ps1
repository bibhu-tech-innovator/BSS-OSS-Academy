$root = "C:\Users\Nilu\Documents\Bibhu\Vibe Coding_practice\vsscoe_bssoss"
function Join-Paths([string]$a, [string]$b, [string]$c, [string]$d) {
    return [System.IO.Path]::Combine($a, $b, $c, $d)
}

$modules = @(
    @{ dir = "foundations"; sections = @(
        @{ file = "bss-vs-oss.html"; sec = "1.1"; title = "BSS vs OSS" }
        @{ file = "catalog-driven-architecture.html"; sec = "1.2"; title = "Catalog-Driven Architecture" }
        @{ file = "commercial-vs-technical.html"; sec = "1.3"; title = "Commercial vs Technical Domains" }
        @{ file = "l2c-process-domains.html"; sec = "1.4"; title = "L2C Process Domains" }
    )}
    @{ dir = "catalog-modeling"; sections = @(
        @{ file = "product-offering-specification.html"; sec = "2.1"; title = "Product Offering Specification" }
        @{ file = "cfs-rfs-resource.html"; sec = "2.2"; title = "CFS/RFS &amp; Resource Specs" }
        @{ file = "relationships-decomposition.html"; sec = "2.3"; title = "Relationships &amp; Decomposition" }
        @{ file = "connectivity-example.html"; sec = "2.4"; title = "Connectivity Example" }
    )}
    @{ dir = "com-som-rom"; sections = @(
        @{ file = "order-management-overview.html"; sec = "3.1"; title = "Order Management Overview" }
        @{ file = "commercial-order-management.html"; sec = "3.2"; title = "Commercial Order Management (COM)" }
        @{ file = "service-order-management.html"; sec = "3.3"; title = "Service Order Management (SOM)" }
        @{ file = "resource-order-management.html"; sec = "3.4"; title = "Resource Order Management (ROM)" }
        @{ file = "orchestration-domains.html"; sec = "3.5"; title = "Orchestration Domains" }
        @{ file = "slm-installed-base.html"; sec = "3.6"; title = "SLM &amp; Installed Base" }
        @{ file = "bpmn-workflows.html"; sec = "3.7"; title = "BPMN 2.0 Workflows" }
        @{ file = "e2e-data-lineage.html"; sec = "3.8"; title = "E2E Data Lineage" }
        @{ file = "simulate-order-workflow.html"; sec = "3.9"; title = "Simulate Order Workflow" }
        @{ file = "hybrid-com-som.html"; sec = "3.10"; title = "Hybrid COM/SOM (ACL)" }
    )}
    @{ dir = "inventory-activation"; sections = @(
        @{ file = "inventory-overview.html"; sec = "4.1"; title = "Inventory Overview" }
        @{ file = "ems-nms-architecture.html"; sec = "4.2"; title = "EMS/NMS Architecture" }
        @{ file = "activation-provisioning.html"; sec = "4.3"; title = "Activation &amp; Provisioning" }
        @{ file = "resource-inventory.html"; sec = "4.4"; title = "Resource Inventory" }
    )}
    @{ dir = "billing"; sections = @(
        @{ file = "overview.html"; sec = "5.1"; title = "Billing Overview" }
        @{ file = "rating-charging.html"; sec = "5.2"; title = "Rating &amp; Charging" }
        @{ file = "mediation.html"; sec = "5.3"; title = "Mediation" }
        @{ file = "subscription-billing.html"; sec = "5.4"; title = "Subscription Billing" }
        @{ file = "convergent-billing.html"; sec = "5.5"; title = "Convergent Billing" }
        @{ file = "revenue-assurance.html"; sec = "5.6"; title = "Revenue Assurance" }
        @{ file = "dunning-collections.html"; sec = "5.7"; title = "Dunning &amp; Collections" }
        @{ file = "interconnect-roaming.html"; sec = "5.8"; title = "Interconnect &amp; Roaming" }
    )}
    @{ dir = "service-assurance"; sections = @(
        @{ file = "overview.html"; sec = "6.1"; title = "Service Assurance Overview" }
        @{ file = "fault-management.html"; sec = "6.2"; title = "Fault Management Pipeline" }
        @{ file = "l2c-assurance-bridge.html"; sec = "6.3"; title = "The L2C-Assurance Bridge" }
        @{ file = "slm-cmdb-integration.html"; sec = "6.4"; title = "SLM-CMDB Integration" }
    )}
    @{ dir = "tmf-open-apis"; sections = @(
        @{ file = "api-introduction.html"; sec = "7.1"; title = "API Introduction" }
        @{ file = "api-reference.html"; sec = "7.2"; title = "API Reference" }
    )}
    @{ dir = "etom-processes"; sections = @(
        @{ file = "etom-overview.html"; sec = "8.1"; title = "eTOM Overview" }
        @{ file = "oda-framework.html"; sec = "8.2"; title = "ODA Framework" }
        @{ file = "lead-to-cash.html"; sec = "8.3"; title = "Lead to Cash" }
        @{ file = "process-system-mapping.html"; sec = "8.4"; title = "Process-System Mapping" }
        @{ file = "etom-l1-l3-mapping.html"; sec = "8.5"; title = "eTOM L1-L3 Mapping" }
    )}
    @{ dir = "vendor-landscape"; sections = @(
        @{ file = "vendor-overview.html"; sec = "9.1"; title = "Vendor Overview" }
        @{ file = "vendor-profiles.html"; sec = "9.2"; title = "Vendor Profiles" }
        @{ file = "vendor-comparison.html"; sec = "9.3"; title = "Vendor Comparison" }
    )}
    @{ dir = "architecture-comparison"; sections = @(
        @{ file = "monolith-vs-modular.html"; sec = "10.1"; title = "Monolith vs Modular" }
        @{ file = "event-driven-architecture.html"; sec = "10.2"; title = "Event-Driven Architecture" }
        @{ file = "migration-coexistence.html"; sec = "10.3"; title = "Migration &amp; Coexistence" }
        @{ file = "bff-channel-patterns.html"; sec = "10.4"; title = "BFF Channel Patterns" }
    )}
    @{ dir = "orchestration-nfv"; sections = @(
        @{ file = "cross-domain-orchestration.html"; sec = "11.1"; title = "Cross-Domain Orchestration" }
        @{ file = "cross-domain-composition.html"; sec = "11.2"; title = "Cross-Domain Composition" }
        @{ file = "domain-integration-pattern.html"; sec = "11.3"; title = "Domain Integration Pattern" }
        @{ file = "fixed-access-broadband.html"; sec = "11.4"; title = "Fixed Access &amp; Broadband" }
        @{ file = "ip-mpls-transport.html"; sec = "11.5"; title = "IP/MPLS Transport" }
        @{ file = "mobile-core-integration.html"; sec = "11.6"; title = "Mobile Core Integration" }
        @{ file = "network-orchestrator-variants.html"; sec = "11.7"; title = "Network Orchestrator Variants" }
    )}
    @{ dir = "b2b-enterprise"; sections = @(
        @{ file = "b2b-vs-b2c.html"; sec = "12.1"; title = "B2B vs B2C" }
        @{ file = "enterprise-cpq.html"; sec = "12.2"; title = "Enterprise CPQ" }
        @{ file = "clm-and-inventory.html"; sec = "12.3"; title = "CLM &amp; Inventory" }
    )}
)

$navCss = ".section-nav { display: flex; justify-content: space-between; gap: 1rem; padding: 2rem 2rem 0; max-width: 800px; }
.section-nav a { flex: 1; display: flex; flex-direction: column; padding: 1rem 1.25rem; border: 1px solid #1e293b; border-radius: 0.5rem; text-decoration: none; transition: all 0.15s; }
.section-nav a:hover { border-color: #475569; background: rgba(255,255,255,0.02); }
.section-nav a:only-child { max-width: 50%; }
.section-nav .nav-label { font-size: 0.7rem; color: #64748b; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 0.25rem; }
.section-nav .nav-title { font-size: 0.9375rem; font-weight: 600; color: #e2e8f0; line-height: 1.3; }
.section-nav .nav-next { text-align: right; margin-left: auto; }"

$count = 0

for ($m = 0; $m -lt $modules.Count; $m++) {
    $mod = $modules[$m]
    $sections = $mod.sections

    $prevMod = if ($m -gt 0) { $modules[$m-1] } else { $null }
    $nextMod = if ($m -lt $modules.Count - 1) { $modules[$m+1] } else { $null }

    for ($i = 0; $i -lt $sections.Count; $i++) {
        $sec = $sections[$i]
        $path = Join-Paths $root "modules" $mod.dir $sec.file
        if (-not (Test-Path $path)) {
            Write-Host "MISSING: $path"
            continue
        }

        $content = Get-Content -LiteralPath $path -Raw
        $alreadyHasNav = ($content -match 'class="section-nav"')

        # --- Build prev link ---
        $prevLink = ""
        if ($i -gt 0) {
            $prev = $sections[$i-1]
            $prevLink = "<a href=`"$($prev.file)`" class=`"nav-prev`">
    <span class=`"nav-label`">&larr; Previous</span>
    <span class=`"nav-title`">$($prev.sec) $($prev.title)</span>
  </a>"
        } elseif ($prevMod) {
            $prev = $prevMod.sections[-1]
            $prevLink = "<a href=`"../$($prevMod.dir)/$($prev.file)`" class=`"nav-prev`">
    <span class=`"nav-label`">&larr; Previous Module</span>
    <span class=`"nav-title`">$($prev.sec) $($prev.title)</span>
  </a>"
        }

        # --- Build next link ---
        $nextLink = ""
        if ($i -lt $sections.Count - 1) {
            $next = $sections[$i+1]
            $nextLink = "<a href=`"$($next.file)`" class=`"nav-next`">
    <span class=`"nav-label`">Next &rarr;</span>
    <span class=`"nav-title`">$($next.sec) $($next.title)</span>
  </a>"
        } elseif ($nextMod) {
            $next = $nextMod.sections[0]
            $nextLink = "<a href=`"../$($nextMod.dir)/$($next.file)`" class=`"nav-next`">
    <span class=`"nav-label`">Next Module &rarr;</span>
    <span class=`"nav-title`">$($next.sec) $($next.title)</span>
  </a>"
        }

        if ($prevLink -eq "" -and $nextLink -eq "") { continue }

        $navHtml = "<div class=`"section-nav`">
  $prevLink$nextLink
</div>

    "

        # Remove old section-nav if present (it will be replaced)
        if ($alreadyHasNav) {
            $content = $content -replace '(?s)<div class="section-nav">.*?</div>\s*', ''
        }

        # Insert nav before footer tag, or replace nav-links in com-som-rom style pages
        if ($content -match '<footer\s+class="footer"') {
            $footerRe = [regex]'(?s)(<footer\s+class="footer"[^>]*>)'
            $content = $footerRe.Replace($content, { param($m) $navHtml + $m.Value })
        } elseif ($content -match '<div class="nav-links">') {
            # Remove old nav-links and insert section-nav before </main>
            $content = $content -replace '(?s)<div class="nav-links">.*?</div>\s*', ''
            $content = $content -replace '(?s)(\s*)(</main>)', "$navHtml`$2"
        }

        # Add CSS if not already present
        if ($content -notmatch '\.section-nav \{') {
            $content = $content -replace '</style>', "$navCss`n</style>"
        }

        Set-Content -LiteralPath $path -Value $content -NoNewline
        $count++
    }
}

Write-Host "Updated $count section pages with prev/next navigation (including cross-module)"
