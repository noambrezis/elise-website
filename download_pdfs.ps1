# PowerShell script to download PDF files from Elise Brezis publications
# This script downloads PDFs from the original website

$baseUrl = "https://www.elisebrezis.com"
$outputDir = "publications"

# Create output directory if it doesn't exist
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir
}

# Function to download PDF with error handling
function Download-PDF {
    param(
        [string]$url,
        [string]$outputFile
    )
    
    try {
        Write-Host "Downloading: $url"
        Invoke-WebRequest -Uri $url -OutFile $outputFile -ErrorAction Stop
        Write-Host "Successfully downloaded: $outputFile"
        return $true
    }
    catch {
        Write-Host "Failed to download $url : $($_.Exception.Message)"
        return $false
    }
}

# List of publications to download (first batch - the ones we know work)
$publications = @(
    @{
        id = "37793-polarization-in-higher-education-and-technological-leadership"
        filename = "polarization-in-higher-education-and-technological-leadership.pdf"
    },
    @{
        id = "34997-are-financial-crises-contagious"
        filename = "are-financial-crises-contagious.pdf"
    },
    @{
        id = "29223-should-we-wish-the-elite-to-engage-in-unethical-behavior-a-consequentialist-theory"
        filename = "should-we-wish-the-elite-to-engage-in-unethical-behavior-a-consequentialist-theory.pdf"
    }
)

# Download PDFs
foreach ($pub in $publications) {
    $url = "$baseUrl/publications/$($pub.id).pdf"
    $outputFile = Join-Path $outputDir $pub.filename
    
    # Only download if file doesn't exist or is a placeholder
    if (!(Test-Path $outputFile) -or (Get-Item $outputFile).Length -lt 1000) {
        Download-PDF -url $url -outputFile $outputFile
        Start-Sleep -Seconds 1  # Be respectful to the server
    } else {
        Write-Host "File already exists: $outputFile"
    }
}

Write-Host "Download completed!"
