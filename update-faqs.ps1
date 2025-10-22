# PowerShell script to add FAQs to all location pages
$locationPages = @(
    "bay-minette-painting.astro",
    "castleberry-painting.astro", 
    "daphne-painting.astro",
    "evergreen-painting.astro",
    "fairhope-painting.astro",
    "flomaton-painting.astro",
    "foley-painting.astro",
    "gulf-shores-painting.astro",
    "lenox-painting.astro",
    "monroeville-painting.astro",
    "orange-beach-painting.astro",
    "repton-painting.astro"
)

$faqSection = @'
    <!-- FAQ Section -->
    <section class="faq">
      <div class="container">
        <h2>Frequently Asked Questions</h2>
        <div class="faq-grid">
          <div class="faq-item">
            <h3>Do you offer emergency painting or fast turnaround jobs?</h3>
            <p>Yes. If you're on a tight deadline or need an emergency painter, we can often schedule rush work for a small additional charge. We prioritize real-estate closings, move-ins, and quick touch-ups.</p>
          </div>
          <div class="faq-item">
            <h3>Are you family-owned?</h3>
            <p>Yes—Brown's Painting LLC is family-owned and operated in South Alabama. Our name and reputation are on every job.</p>
          </div>
          <div class="faq-item">
            <h3>What areas do you serve?</h3>
            <p>Baldwin, Mobile, Escambia, Conecuh, and Monroe Counties—Brewton, Fairhope, Daphne, Spanish Fort, Foley, Gulf Shores, Orange Beach, Bay Minette, Atmore, Evergreen, Monroeville, and nearby communities.</p>
          </div>
          <div class="faq-item">
            <h3>Do you provide free estimates?</h3>
            <p>Yes. We offer free on-site or virtual estimates and clear written proposals.</p>
          </div>
          <div class="faq-item">
            <h3>What paint brands do you use?</h3>
            <p>Professional-grade systems from Sherwin-Williams, Benjamin Moore, and PPG—specified for South Alabama humidity and coastal salt air when needed.</p>
          </div>
          <div class="faq-item">
            <h3>Are you licensed and insured?</h3>
            <p>Yes. Brown's Painting LLC is fully licensed and insured in Alabama for residential and light commercial work.</p>
          </div>
          <div class="faq-item">
            <h3>Do you offer cabinet refinishing or repainting?</h3>
            <p>Yes—degrease, sand, prime, and sprayed topcoats for a smooth, durable, factory-style finish.</p>
          </div>
          <div class="faq-item">
            <h3>How long will my project take?</h3>
            <p>Typical interiors: 1–3 days. Full exteriors: 3–5 days depending on prep, size, and weather. We confirm timelines before work begins.</p>
          </div>
          <div class="faq-item">
            <h3>Do you require a deposit?</h3>
            <p>Yes. A small deposit (typically 30% or materials cost) reserves your start date and covers supplies. The balance is due at completion after your walk-through.</p>
          </div>
          <div class="faq-item">
            <h3>Do you handle drywall repair and surface prep?</h3>
            <p>Yes—patching, texture match, caulking, sanding, and primer for proper adhesion and a flawless finish.</p>
          </div>
          <div class="faq-item">
            <h3>What payment methods do you accept?</h3>
            <p>Cash, check, and major credit/debit cards. Secure digital invoices available.</p>
          </div>
          <div class="faq-item">
            <h3>Can you color-match existing paint?</h3>
            <p>Yes. We can match most colors with professional tinting tools for seamless touch-ups.</p>
          </div>
          <div class="faq-item">
            <h3>What happens if it rains or the weather turns?</h3>
            <p>We monitor weather closely and adjust scheduling to protect surfaces. If rain or high humidity would compromise quality, we pause and resume at the first safe window.</p>
          </div>
          <div class="faq-item">
            <h3>Do you protect landscaping, floors, and furniture?</h3>
            <p>Absolutely. We mask and cover, move light items as needed, and clean up daily. Final cleanup is part of completion.</p>
          </div>
          <div class="faq-item">
            <h3>Do you offer warranties?</h3>
            <p>Yes—workmanship warranty on labor and standard manufacturer warranties on coatings. Your proposal will outline coverage and term for your project.</p>
          </div>
          <div class="faq-item">
            <h3>Do you use low-odor / low-VOC paints?</h3>
            <p>Yes. On interiors we often specify low- or zero-VOC coatings for healthier indoor air.</p>
          </div>
          <div class="faq-item">
            <h3>Can you help me choose colors or finishes?</h3>
            <p>Yes. We offer basic color guidance at no charge and can provide full color consultations on request.</p>
          </div>
          <div class="faq-item">
            <h3>Do you paint exterior materials like brick, stucco, and metal?</h3>
            <p>Yes—wood siding, Hardie, brick (including limewash/painted brick), stucco, and metal substrates with the appropriate primers and systems.</p>
          </div>
          <div class="faq-item">
            <h3>Do you pressure-wash exteriors before painting?</h3>
            <p>Yes. We include washing and surface prep to remove chalking, mildew, and salt residue for better adhesion.</p>
          </div>
          <div class="faq-item">
            <h3>Do you follow lead-safe practices for older homes?</h3>
            <p>For homes built before 1978, we follow lead-safe prep and containment best practices and discuss options during your estimate if applicable.</p>
          </div>
        </div>
      </div>
    </section>
'@

$faqCSS = @'
  .faq {
    padding: 4rem 0;
    background: #f8fafc;
  }

  .faq-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 1.5rem;
    margin-top: 3rem;
  }

  .faq-item {
    background: white;
    padding: 2rem;
    border-radius: 12px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.05);
    border-left: 4px solid #3b82f6;
  }

  .faq-item h3 {
    color: #1e3a8a;
    margin-bottom: 1rem;
    font-size: 1.125rem;
    font-weight: 600;
  }

  .faq-item p {
    color: #4b5563;
    line-height: 1.6;
  }
'@

foreach ($page in $locationPages) {
    $filePath = "src\pages\$page"
    if (Test-Path $filePath) {
        Write-Host "Processing $page..."
        
        # Read the file content
        $content = Get-Content $filePath -Raw
        
        # Check if FAQ section already exists
        if ($content -notmatch "<!-- FAQ Section -->") {
            # Add FAQ section before CTA section
            $content = $content -replace "(\s*<!-- CTA Section -->)", "`n$faqSection`n`n`$1"
            
            # Add FAQ CSS before cta-section CSS
            $content = $content -replace "(\s*\.cta-section \{)", "`n$faqCSS`n`n`$1"
            
            # Write the updated content back to the file
            Set-Content $filePath -Value $content -NoNewline
            Write-Host "Updated $page successfully"
        } else {
            Write-Host "$page already has FAQ section, skipping..."
        }
    } else {
        Write-Host "File $filePath not found, skipping..."
    }
}

Write-Host "FAQ update process completed!"
