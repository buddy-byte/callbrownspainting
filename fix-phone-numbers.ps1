# Fix phone numbers in all location pages
$files = @(
    "src\pages\atmore-painting.astro",
    "src\pages\bay-minette-painting.astro", 
    "src\pages\castleberry-painting.astro",
    "src\pages\creola-painting.astro",
    "src\pages\evergreen-painting.astro",
    "src\pages\flomaton-painting.astro",
    "src\pages\lenox-painting.astro",
    "src\pages\monroeville-painting.astro",
    "src\pages\repton-painting.astro",
    "src\pages\saraland-painting.astro",
    "src\pages\theodore-painting.astro",
    "src\pages\blog\essential-painting-tips-alabama.astro"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "Updating $file"
        (Get-Content $file) -replace "tel:\+1251XXX-XXXX", "tel:+12512374545" -replace "\(251\) XXX-XXXX", "(251) 237-4545" | Set-Content $file
    }
}

# Also fix component files
$componentFiles = @(
    "src\components\BoomerProfile.astro",
    "src\components\Testimonials.astro", 
    "src\components\ProjectGallery.astro"
)

foreach ($file in $componentFiles) {
    if (Test-Path $file) {
        Write-Host "Updating $file"
        (Get-Content $file) -replace "tel:\+1251XXX-XXXX", "tel:+12512374545" -replace "\(251\) XXX-XXXX", "(251) 237-4545" | Set-Content $file
    }
}

Write-Host "Phone number updates complete!"




