# Image Optimization Script for Brown's Painting Website
param(
    [string]$InputPath = "public\images"
)

Write-Host "Starting Image Optimization..." -ForegroundColor Green

$magickPath = "C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe"

if (-not (Test-Path $magickPath)) {
    Write-Host "ImageMagick not found at: $magickPath" -ForegroundColor Red
    exit 1
}

Write-Host "ImageMagick found" -ForegroundColor Green

$imageFiles = Get-ChildItem -Path $InputPath -Recurse -Include "*.jpg", "*.jpeg", "*.png", "*.gif" | Where-Object { !$_.Name.EndsWith(".webp") }

if ($imageFiles.Count -eq 0) {
    Write-Host "No images found in $InputPath" -ForegroundColor Yellow
    Write-Host "Upload your images to the public/images directory first" -ForegroundColor Yellow
    exit 0
}

Write-Host "Found $($imageFiles.Count) images to process..." -ForegroundColor Cyan

$convertedCount = 0

foreach ($file in $imageFiles) {
    Write-Host "Processing: $($file.Name)" -ForegroundColor Cyan
    
    $outputDir = $file.DirectoryName
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $webpFile = Join-Path $outputDir "${baseName}.webp"
    
    $quality = 80
    if ($file.Name -match "hero|banner|main") {
        $quality = 85
    } elseif ($file.Name -match "thumb|icon") {
        $quality = 75
    }
    
    try {
        & $magickPath $file.FullName -quality $quality $webpFile
        
        if ($LASTEXITCODE -eq 0) {
            $originalSize = (Get-Item $file.FullName).Length
            $newSize = (Get-Item $webpFile).Length
            $savings = [math]::Round((($originalSize - $newSize) / $originalSize) * 100, 1)
            Write-Host "Converted: $(Split-Path $file.FullName -Leaf) -> $(Split-Path $webpFile -Leaf) (${savings}% smaller)" -ForegroundColor Green
            $convertedCount++
        } else {
            Write-Host "Failed to convert: $(Split-Path $file.FullName -Leaf)" -ForegroundColor Red
        }
    } catch {
        Write-Host "Error converting: $(Split-Path $file.FullName -Leaf) - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "Image Optimization Complete!" -ForegroundColor Green
Write-Host "Converted: $convertedCount images" -ForegroundColor Green