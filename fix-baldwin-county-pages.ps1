# Fix Baldwin County Location Pages - CSS and JavaScript Issues
# This script fixes the CSS class mismatches and adds proper hero carousel functionality

$pages = @(
    "gulf-shores-painting.astro",
    "fairhope-painting.astro", 
    "spanish-fort-painting.astro",
    "loxley-painting.astro",
    "robertsdale-painting.astro",
    "foley-painting.astro",
    "elberta-painting.astro",
    "silverhill-painting.astro",
    "summerdale-painting.astro",
    "magnolia-springs-painting.astro",
    "perdido-beach-painting.astro",
    "bon-secour-painting.astro",
    "lillian-painting.astro",
    "seminole-painting.astro",
    "barnwell-painting.astro",
    "marlow-painting.astro",
    "bromley-painting.astro",
    "stapleton-painting.astro",
    "rabun-painting.astro",
    "pine-grove-painting.astro",
    "battles-wharf-painting.astro",
    "fort-morgan-painting.astro",
    "gasque-painting.astro",
    "seacliff-painting.astro",
    "jubilee-painting.astro",
    "point-clear-painting.astro",
    "montrose-painting.astro",
    "clay-city-painting.astro",
    "crossroads-painting.astro",
    "tanner-williams-painting.astro",
    "stockton-painting.astro",
    "tensaw-painting.astro",
    "bucks-painting.astro",
    "perdido-painting.astro",
    "perdido-key-painting.astro",
    "innerarity-point-painting.astro",
    "onlooker-painting.astro",
    "pleasure-island-painting.astro",
    "alabama-point-painting.astro",
    "perdido-pass-painting.astro",
    "bear-point-painting.astro",
    "cotton-bayou-painting.astro",
    "romar-beach-painting.astro",
    "terry-cove-painting.astro",
    "ono-island-painting.astro",
    "flora-bama-painting.astro",
    "wharf-orange-beach-painting.astro",
    "orange-beach-marina-painting.astro",
    "bear-point-marina-painting.astro",
    "perdido-key-marina-painting.astro",
    "flora-bama-marina-painting.astro",
    "perdido-beach-marina-painting.astro",
    "gulf-shores-marina-painting.astro",
    "fort-morgan-marina-painting.astro",
    "gasque-marina-painting.astro",
    "seacliff-marina-painting.astro",
    "jubilee-marina-painting.astro",
    "point-clear-marina-painting.astro",
    "montrose-marina-painting.astro",
    "clay-city-marina-painting.astro",
    "crossroads-marina-painting.astro",
    "tanner-williams-marina-painting.astro",
    "stockton-marina-painting.astro",
    "tensaw-marina-painting.astro",
    "bucks-marina-painting.astro",
    "perdido-marina-painting.astro",
    "perdido-key-marina-painting.astro",
    "innerarity-point-marina-painting.astro",
    "onlooker-marina-painting.astro",
    "pleasure-island-marina-painting.astro",
    "alabama-point-marina-painting.astro",
    "perdido-pass-marina-painting.astro",
    "bear-point-marina-painting.astro",
    "cotton-bayou-marina-painting.astro",
    "romar-beach-marina-painting.astro",
    "terry-cove-marina-painting.astro",
    "ono-island-marina-painting.astro",
    "flora-bama-marina-painting.astro",
    "wharf-orange-beach-marina-painting.astro",
    "orange-beach-marina-marina-painting.astro",
    "bear-point-marina-marina-painting.astro"
)

$heroCSS = @"
    .hero {
      position: relative;
      height: 100vh;
      min-height: 600px;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }

    .hero-background {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 1;
    }

    .hero-slide {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-size: cover;
      background-repeat: no-repeat;
      opacity: 0;
      transition: opacity 3s ease-in-out;
    }

    .hero-slide:first-child {
      opacity: 1;
    }

    .hero-overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.4);
      z-index: 2;
    }

    .hero-content {
      position: relative;
      z-index: 3;
      text-align: center;
      color: white;
      max-width: 1200px;
      padding: 0 2rem;
    }

    .hero-text {
      margin-bottom: 2rem;
    }

    .hero-logo-image {
      max-width: 300px;
      height: auto;
      margin-bottom: 1rem;
    }

    .hero h1 {
      font-size: clamp(2.5rem, 5vw, 4rem);
      font-weight: 700;
      margin-bottom: 1rem;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }

    .phone-number {
      font-size: clamp(1.2rem, 3vw, 1.5rem);
      margin-bottom: 2rem;
    }

    .phone-number a {
      color: #ff6b35;
      text-decoration: none;
      font-weight: 700;
    }

    .hero-cta {
      margin-bottom: 2rem;
    }

    .hero-trust-badges {
      display: flex;
      justify-content: center;
      gap: 2rem;
      flex-wrap: wrap;
      margin-top: 2rem;
    }

    .trust-badge {
      background: rgba(255, 255, 255, 0.1);
      padding: 1rem 1.5rem;
      border-radius: 8px;
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .trust-stars {
      color: #ffd700;
      font-size: 1.2rem;
      margin-bottom: 0.5rem;
    }

    .trust-text {
      font-size: 0.9rem;
      font-weight: 600;
    }

    .hero-dots {
      position: absolute;
      bottom: 2rem;
      left: 50%;
      transform: translateX(-50%);
      display: flex;
      gap: 0.5rem;
      z-index: 3;
    }

    .dot {
      width: 12px;
      height: 12px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.5);
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .dot.active {
      background: #ff6b35;
    }
"@

$heroJS = @"
  <script>
    // Hero carousel functionality
    document.addEventListener('DOMContentLoaded', function() {
      const slides = document.querySelectorAll('.hero-slide');
      const dots = document.querySelectorAll('.dot');
      let currentSlide = 0;

      function showSlide(index) {
        slides.forEach((slide, i) => {
          slide.style.opacity = i === index ? '1' : '0';
        });
        dots.forEach((dot, i) => {
          dot.classList.toggle('active', i === index);
        });
      }

      function nextSlide() {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
      }

      // Auto-advance slides every 5 seconds
      setInterval(nextSlide, 5000);

      // Dot navigation
      dots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
          currentSlide = index;
          showSlide(currentSlide);
        });
      });
    });
  </script>
"@

Write-Host "Starting Baldwin County pages fix..." -ForegroundColor Green

foreach ($page in $pages) {
    $filePath = "src\pages\$page"
    
    if (Test-Path $filePath) {
        Write-Host "Processing $page..." -ForegroundColor Yellow
        
        # Read the file content
        $content = Get-Content $filePath -Raw
        
        # Check if the file has the hero structure but wrong CSS
        if ($content -match 'class="hero"' -and $content -match 'class="city-hero"') {
            Write-Host "  - Fixing CSS class mismatch..." -ForegroundColor Cyan
            
            # Replace the old city-hero CSS with new hero CSS
            $content = $content -replace '(?s)\.city-hero\s*\{[^}]*\}', $heroCSS
            
            # Remove duplicate city-hero h1 rule
            $content = $content -replace '(?s)\.city-hero h1\s*\{[^}]*\}', ''
            
            # Add JavaScript if not present
            if ($content -notmatch 'Hero carousel functionality') {
                Write-Host "  - Adding hero carousel JavaScript..." -ForegroundColor Cyan
                $content = $content -replace '</BaseLayout>', "$heroJS`n</BaseLayout>"
            }
            
            # Write the updated content back
            Set-Content $filePath $content -NoNewline
            
            Write-Host "  - Fixed $page" -ForegroundColor Green
        } else {
            Write-Host "  - Skipping $page (no hero structure found)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  - File not found: $page" -ForegroundColor Red
    }
}

Write-Host "`nBaldwin County pages fix completed!" -ForegroundColor Green
Write-Host "All pages should now have proper hero carousel functionality." -ForegroundColor Green



