# Simple Image Optimization Script for Brown's Painting Website
# Converts images to WebP format with quality optimization

param(
    [string]$InputPath = "public\images"
)

Write-Host "🎨 Starting Image Optimization for Brown's Painting Website..." -ForegroundColor Green

# ImageMagick path
$magickPath = "C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe"

# Check if ImageMagick exists
if (-not (Test-Path $magickPath)) {
    Write-Host "❌ ImageMagick not found at: $magickPath" -ForegroundColor Red
    Write-Host "Please install ImageMagick from: https://imagemagick.org/script/download.php#windows" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ ImageMagick found" -ForegroundColor Green

# Get all image files
$imageFiles = Get-ChildItem -Path $InputPath -Recurse -Include "*.jpg", "*.jpeg", "*.png", "*.gif" | Where-Object { !$_.Name.EndsWith(".webp") }

if ($imageFiles.Count -eq 0) {
    Write-Host "ℹ️  No images found in $InputPath" -ForegroundColor Yellow
    Write-Host "   Upload your images to the public/images directory first" -ForegroundColor Yellow
    Write-Host "   Example: public/images/projects/house-before.jpg" -ForegroundColor Yellow
    exit 0
}

Write-Host "📁 Found $($imageFiles.Count) images to process..." -ForegroundColor Cyan

$convertedCount = 0

foreach ($file in $imageFiles) {
    Write-Host "🔄 Processing: $($file.Name)" -ForegroundColor Cyan
    
    $outputDir = $file.DirectoryName
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $webpFile = Join-Path $outputDir "${baseName}.webp"
    
    # Determine quality based on file type
    $quality = 80
    if ($file.Name -match "hero|banner|main") {
        $quality = 85
    } elseif ($file.Name -match "thumb|icon") {
        $quality = 75
    }
    
    try {
        # Convert to WebP
        & $magickPath $file.FullName -quality $quality $webpFile
        
        if ($LASTEXITCODE -eq 0) {
            $originalSize = (Get-Item $file.FullName).Length
            $newSize = (Get-Item $webpFile).Length
            $savings = [math]::Round((($originalSize - $newSize) / $originalSize) * 100, 1)
            Write-Host "   ✅ Converted: $(Split-Path $file.FullName -Leaf) → $(Split-Path $webpFile -Leaf) (${savings}% smaller)" -ForegroundColor Green
            $convertedCount++
        } else {
            Write-Host "   ❌ Failed to convert: $(Split-Path $file.FullName -Leaf)" -ForegroundColor Red
        }
    } catch {
        Write-Host "   ❌ Error converting: $(Split-Path $file.FullName -Leaf) - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`n🎉 Image Optimization Complete!" -ForegroundColor Green
Write-Host "   ✅ Converted: $convertedCount images" -ForegroundColor Green
Write-Host "   📁 Output directory: $InputPath" -ForegroundColor Cyan
Write-Host "`n💡 Next steps:" -ForegroundColor Yellow
Write-Host "   1. Your images are now optimized with WebP format" -ForegroundColor White
Write-Host "   2. The website will automatically use WebP when available" -ForegroundColor White
Write-Host "   3. Test the website to ensure all images load correctly" -ForegroundColor White
