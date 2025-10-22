# Fix excessive padding and spacing on all location pages
$locationPages = @(
    "brewton-painting.astro",
    "evergreen-painting.astro", 
    "atmore-painting.astro",
    "monroeville-painting.astro",
    "bay-minette-painting.astro",
    "foley-painting.astro",
    "fairhope-painting.astro",
    "daphne-painting.astro",
    "gulf-shores-painting.astro",
    "orange-beach-painting.astro",
    "mobile-painting.astro",
    "saraland-painting.astro",
    "theodore-painting.astro",
    "creola-painting.astro",
    "flomaton-painting.astro",
    "lenox-painting.astro",
    "repton-painting.astro",
    "castleberry-painting.astro"
)

foreach ($page in $locationPages) {
    $filePath = "src\pages\$page"
    
    if (Test-Path $filePath) {
        Write-Host "Fixing $page..."
        
        # Read the file content
        $content = Get-Content $filePath -Raw
        
        # Fix excessive padding in city-hero
        $content = $content -replace 'padding: 6rem 0 4rem;', 'padding: 3rem 0 2rem;'
        $content = $content -replace 'padding: 5rem 0 3rem;', 'padding: 3rem 0 2rem;'
        $content = $content -replace 'padding: 4rem 0 3rem;', 'padding: 3rem 0 2rem;'
        
        # Fix excessive padding in city-services
        $content = $content -replace 'padding: 5rem 0;', 'padding: 2rem 0;'
        $content = $content -replace 'padding: 4rem 0;', 'padding: 2rem 0;'
        $content = $content -replace 'padding: 3rem 0;', 'padding: 2rem 0;'
        
        # Fix excessive margin-bottom on h2 elements
        $content = $content -replace 'margin-bottom: 3rem;', 'margin-bottom: 2rem;'
        $content = $content -replace 'margin-bottom: 4rem;', 'margin-bottom: 2rem;'
        
        # Fix excessive margin-bottom on services-grid
        $content = $content -replace 'margin-bottom: 4rem;', 'margin-bottom: 2rem;'
        $content = $content -replace 'margin-bottom: 3rem;', 'margin-bottom: 2rem;'
        
        # Write the fixed content back
        Set-Content $filePath $content -NoNewline
        
        Write-Host "Fixed $page"
    } else {
        Write-Host "File not found: $filePath"
    }
}

Write-Host "All location pages fixed!"
