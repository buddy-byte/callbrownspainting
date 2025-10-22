# PowerShell script to update all location and service pages to match homepage layout
Write-Host "Starting location page updates to match homepage layout..." -ForegroundColor Green

# Define the pages to update
$locationPages = @(
    "atmore-painting.astro",
    "bay-minette-painting.astro", 
    "brewton-painting.astro",
    "castleberry-painting.astro",
    "creola-painting.astro",
    "daphne-painting.astro",
    "evergreen-painting.astro",
    "fairhope-painting.astro",
    "flomaton-painting.astro",
    "foley-painting.astro",
    "gulf-shores-painting.astro",
    "lenox-painting.astro",
    "mobile-painting.astro",
    "monroeville-painting.astro",
    "orange-beach-painting.astro",
    "repton-painting.astro",
    "saraland-painting.astro",
    "theodore-painting.astro"
)

$servicePages = @(
    "interior-painting.astro",
    "exterior-painting.astro",
    "commercial-painting.astro",
    "emergency-painting.astro"
)

# Function to update a page with homepage layout
function Update-PageLayout {
    param($pageName, $pageType)
    
    Write-Host "Updating $pageName..." -ForegroundColor Yellow
    
    $filePath = "src\pages\$pageName"
    
    if (Test-Path $filePath) {
        # Read the current file
        $content = Get-Content $filePath -Raw
        
        # Extract city name from filename for location pages
        if ($pageType -eq "location") {
            $cityName = $pageName -replace "-painting\.astro$", ""
            $cityName = $cityName -replace "-", " "
            $cityName = (Get-Culture).TextInfo.ToTitleCase($cityName)
        }
        
        # Create the new hero section structure
        $newHeroSection = @"
    <section class="hero">
      <div class="hero-background">
        <div class="hero-slide" style="background-image: url('/images/hero/hero-1-optimized.jpg'); background-position: center center;"></div>
        <div class="hero-slide" style="background-image: url('/images/hero/hero-2-optimized.jpg'); background-position: center center;"></div>
        <div class="hero-slide" style="background-image: url('/images/hero/hero-3-optimized.jpg'); background-position: center top;"></div>
      </div>
      <div class="hero-overlay"></div>
      <div class="hero-content">
        <div class="hero-text">
          <img src="/images/logo/browns-painting-logo-hat.png" alt="Brown's Painting Logo" class="hero-logo-image">
          <h1>Professional Painting Services in $cityName, AL</h1>
          <p class="phone-number">Call Us Today at <a href="tel:+12512374545">(251) 237-4545</a></p>
          <div class="hero-cta">
            <a href="/contact" class="btn btn-primary">Get Free Estimate</a>
          </div>
        </div>
        <div class="hero-trust-badges">
          <div class="trust-badge">
            <div class="trust-stars">★★★★★</div>
            <div class="trust-text">25+ Years Experience</div>
          </div>
          <div class="trust-badge">
            <div class="trust-text">Licensed & Insured</div>
          </div>
          <div class="trust-badge">
            <div class="trust-text">100% Guaranteed</div>
          </div>
        </div>
      </div>
      <div class="hero-dots">
        <span class="dot active"></span>
        <span class="dot"></span>
        <span class="dot"></span>
      </div>
    </section>
"@

        # Replace the existing hero section
        $content = $content -replace '(?s)<section class="[^"]*hero[^"]*">.*?</section>', $newHeroSection
        
        # Write the updated content back to the file
        Set-Content $filePath $content -Encoding UTF8
        Write-Host "Updated $pageName" -ForegroundColor Green
    } else {
        Write-Host "File not found: $filePath" -ForegroundColor Red
    }
}

# Update all location pages
Write-Host "Updating location pages..." -ForegroundColor Cyan
foreach ($page in $locationPages) {
    Update-PageLayout $page "location"
}

# Update all service pages  
Write-Host "Updating service pages..." -ForegroundColor Cyan
foreach ($page in $servicePages) {
    Update-PageLayout $page "service"
}

Write-Host "All pages updated! The location and service pages now match the homepage layout." -ForegroundColor Green
Write-Host "Please refresh your browser to see the changes." -ForegroundColor Yellow