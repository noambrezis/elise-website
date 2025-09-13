# PowerShell script to download all PDF files from Elise Brezis publications
# Run this script to download all the actual PDF files

$baseUrl = "https://www.elisebrezis.com"
$outputDir = "publications"

# Create output directory if it doesn't exist
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir
}

# Function to download PDF with error handling and retry
function Download-PDF {
    param(
        [string]$url,
        [string]$outputFile,
        [int]$maxRetries = 3
    )
    
    for ($i = 1; $i -le $maxRetries; $i++) {
        try {
            Write-Host "Downloading: $url (Attempt $i)"
            Invoke-WebRequest -Uri $url -OutFile $outputFile -ErrorAction Stop -TimeoutSec 30
            Write-Host "Successfully downloaded: $outputFile" -ForegroundColor Green
            return $true
        }
        catch {
            Write-Host "Failed to download $url (Attempt $i): $($_.Exception.Message)" -ForegroundColor Red
            if ($i -eq $maxRetries) {
                return $false
            }
            Start-Sleep -Seconds 2
        }
    }
}

# List of all publications to download
$publications = @(
    # Working Papers
    @{ id = "37793-polarization-in-higher-education-and-technological-leadership"; filename = "polarization-in-higher-education-and-technological-leadership.pdf" },
    @{ id = "34997-are-financial-crises-contagious"; filename = "are-financial-crises-contagious.pdf" },
    @{ id = "29223-should-we-wish-the-elite-to-engage-in-unethical-behavior-a-consequentialist-theory"; filename = "should-we-wish-the-elite-to-engage-in-unethical-behavior-a-consequentialist-theory.pdf" },
    
    # Published Papers
    @{ id = "15961-regulating-the-revolving-door-of-regulators-legal-vs-ethical-issues"; filename = "regulating-the-revolving-door-of-regulators-legal-vs-ethical-issues.pdf" },
    @{ id = "13045-why-was-keynes-opposed-to-reparations-and-a-carthaginian-peace"; filename = "why-was-keynes-opposed-to-reparations-and-a-carthaginian-peace.pdf" },
    @{ id = "15960-will-automation-and-robotics-lead-to-more-inequality"; filename = "will-automation-and-robotics-lead-to-more-inequality.pdf" },
    @{ id = "20005-should-we-regulate-the-revolving-door-of-regulators"; filename = "should-we-regulate-the-revolving-door-of-regulators.pdf" },
    @{ id = "13070-arbitrariness-in-the-peer-review-process"; filename = "arbitrariness-in-the-peer-review-process.pdf" },
    @{ id = "13069-the-revolving-door-state-connections-and-inequality-of-influence-in-the-financial-sector"; filename = "the-revolving-door-state-connections-and-inequality-of-influence-in-the-financial-sector.pdf" },
    @{ id = "13068-should-individuals-migrate-before-acquiring-education-or-after-a-new-model-of-brain-waste-vs-brain-drain"; filename = "should-individuals-migrate-before-acquiring-education-or-after-a-new-model-of-brain-waste-vs-brain-drain.pdf" },
    @{ id = "13065-productivity-gap-between-sectors-and-double-duality-in-labor-markets"; filename = "productivity-gap-between-sectors-and-double-duality-in-labor-markets.pdf" },
    @{ id = "13039-elitism-in-higher-education-and-inequality-why-are-the-nordic-countries-so-special"; filename = "elitism-in-higher-education-and-inequality-why-are-the-nordic-countries-so-special.pdf" },
    @{ id = "13038-social-mobility-at-the-top-and-the-higher-education-system"; filename = "social-mobility-at-the-top-and-the-higher-education-system.pdf" },
    @{ id = "13066-scientometrics-of-peer-review"; filename = "scientometrics-of-peer-review.pdf" },
    @{ id = "13064-legal-conflicts-of-interest-of-the-revolving-door"; filename = "legal-conflicts-of-interest-of-the-revolving-door.pdf" },
    @{ id = "13062-endogenous-fertility-with-a-sibship-size-effect"; filename = "endogenous-fertility-with-a-sibship-size-effect.pdf" },
    @{ id = "13183-financial-sector-regulation-and-the-revolving-door-in-us-commercial-banks"; filename = "financial-sector-regulation-and-the-revolving-door-in-us-commercial-banks.pdf" },
    @{ id = "13061-why-migrate-for-study-or-for-work"; filename = "why-migrate-for-study-or-for-work.pdf" },
    @{ id = "13063-population-and-economic-growth-ancient-and-modern"; filename = "population-and-economic-growth-ancient-and-modern.pdf" },
    @{ id = "13129-paid-basic-income-fertility-rates-and-economic-growth"; filename = "paid-basic-income-fertility-rates-and-economic-growth.pdf" },
    @{ id = "13023-geography-economics-and-political-systems-a-bird-s-eye-view"; filename = "geography-economics-and-political-systems-a-bird-s-eye-view.pdf" },
    @{ id = "13032-brain-drain-and-development-traps"; filename = "brain-drain-and-development-traps.pdf" },
    @{ id = "13016-non-linear-geographics-and-the-economics-of-transition-and-democratization"; filename = "non-linear-geographics-and-the-economics-of-transition-and-democratization.pdf" },
    @{ id = "13186-why-are-us-universities-at-the-top-of-the-international-rankings"; filename = "why-are-us-universities-at-the-top-of-the-international-rankings.pdf" },
    @{ id = "13185-the-consequences-to-the-banks-of-the-collapse-of-money-values-1931-and-2009-some-comments"; filename = "the-consequences-to-the-banks-of-the-collapse-of-money-values-1931-and-2009-some-comments.pdf" },
    @{ id = "13055-can-demographic-transition-only-be-explained-by-altruistic-and-neo-malthusian-models"; filename = "can-demographic-transition-only-be-explained-by-altruistic-and-neo-malthusian-models.pdf" },
    @{ id = "13057-focal-randomisation-an-optimal-mechanism-for-the-evaluation-of-r-d-projects"; filename = "focal-randomisation-an-optimal-mechanism-for-the-evaluation-of-r-d-projects.pdf" },
    @{ id = "13154-disengagement-can-it-improve-the-palestinian-economy"; filename = "disengagement-can-it-improve-the-palestinian-economy.pdf" }
)

Write-Host "Starting download of $($publications.Count) PDF files..." -ForegroundColor Cyan
Write-Host ""

$successCount = 0
$failCount = 0

# Download PDFs
foreach ($pub in $publications) {
    $url = "$baseUrl/publications/$($pub.id).pdf"
    $outputFile = Join-Path $outputDir $pub.filename
    
    # Check if file exists and is not a placeholder (larger than 1KB)
    $shouldDownload = $true
    if (Test-Path $outputFile) {
        $fileSize = (Get-Item $outputFile).Length
        if ($fileSize -gt 1000) {
            Write-Host "File already exists and appears to be real: $($pub.filename)" -ForegroundColor Yellow
            $shouldDownload = $false
        }
    }
    
    if ($shouldDownload) {
        if (Download-PDF -url $url -outputFile $outputFile) {
            $successCount++
        } else {
            $failCount++
        }
        Start-Sleep -Seconds 1  # Be respectful to the server
    } else {
        $successCount++
    }
}

Write-Host ""
Write-Host "Download Summary:" -ForegroundColor Cyan
Write-Host "Successfully downloaded: $successCount" -ForegroundColor Green
Write-Host "Failed downloads: $failCount" -ForegroundColor Red
Write-Host ""
Write-Host "Download completed! Check the publications folder for the PDF files." -ForegroundColor Cyan
