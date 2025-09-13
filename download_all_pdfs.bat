@echo off
echo Downloading PDF files from Elise Brezis publications...
echo.

REM Create publications directory if it doesn't exist
if not exist "publications" mkdir publications

REM Download PDFs using PowerShell Invoke-WebRequest
echo Downloading PDF files...

REM First batch - Working Papers
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/37793-polarization-in-higher-education-and-technological-leadership.pdf' -OutFile 'publications/polarization-in-higher-education-and-technological-leadership.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/34997-are-financial-crises-contagious.pdf' -OutFile 'publications/are-financial-crises-contagious.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/29223-should-we-wish-the-elite-to-engage-in-unethical-behavior-a-consequentialist-theory.pdf' -OutFile 'publications/should-we-wish-the-elite-to-engage-in-unethical-behavior-a-consequentialist-theory.pdf'"

REM Second batch - Published Papers
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/15961-regulating-the-revolving-door-of-regulators-legal-vs-ethical-issues.pdf' -OutFile 'publications/regulating-the-revolving-door-of-regulators-legal-vs-ethical-issues.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13045-why-was-keynes-opposed-to-reparations-and-a-carthaginian-peace.pdf' -OutFile 'publications/why-was-keynes-opposed-to-reparations-and-a-carthaginian-peace.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/15960-will-automation-and-robotics-lead-to-more-inequality.pdf' -OutFile 'publications/will-automation-and-robotics-lead-to-more-inequality.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/20005-should-we-regulate-the-revolving-door-of-regulators.pdf' -OutFile 'publications/should-we-regulate-the-revolving-door-of-regulators.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13070-arbitrariness-in-the-peer-review-process.pdf' -OutFile 'publications/arbitrariness-in-the-peer-review-process.pdf'"

REM Third batch - More Published Papers
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13069-the-revolving-door-state-connections-and-inequality-of-influence-in-the-financial-sector.pdf' -OutFile 'publications/the-revolving-door-state-connections-and-inequality-of-influence-in-the-financial-sector.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13068-should-individuals-migrate-before-acquiring-education-or-after-a-new-model-of-brain-waste-vs-brain-drain.pdf' -OutFile 'publications/should-individuals-migrate-before-acquiring-education-or-after-a-new-model-of-brain-waste-vs-brain-drain.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13065-productivity-gap-between-sectors-and-double-duality-in-labor-markets.pdf' -OutFile 'publications/productivity-gap-between-sectors-and-double-duality-in-labor-markets.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13039-elitism-in-higher-education-and-inequality-why-are-the-nordic-countries-so-special.pdf' -OutFile 'publications/elitism-in-higher-education-and-inequality-why-are-the-nordic-countries-so-special.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13038-social-mobility-at-the-top-and-the-higher-education-system.pdf' -OutFile 'publications/social-mobility-at-the-top-and-the-higher-education-system.pdf'"

REM Fourth batch - More Published Papers
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13066-scientometrics-of-peer-review.pdf' -OutFile 'publications/scientometrics-of-peer-review.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13064-legal-conflicts-of-interest-of-the-revolving-door.pdf' -OutFile 'publications/legal-conflicts-of-interest-of-the-revolving-door.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13062-endogenous-fertility-with-a-sibship-size-effect.pdf' -OutFile 'publications/endogenous-fertility-with-a-sibship-size-effect.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13183-financial-sector-regulation-and-the-revolving-door-in-us-commercial-banks.pdf' -OutFile 'publications/financial-sector-regulation-and-the-revolving-door-in-us-commercial-banks.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13061-why-migrate-for-study-or-for-work.pdf' -OutFile 'publications/why-migrate-for-study-or-for-work.pdf'"

REM Fifth batch - More Published Papers
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13063-population-and-economic-growth-ancient-and-modern.pdf' -OutFile 'publications/population-and-economic-growth-ancient-and-modern.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13129-paid-basic-income-fertility-rates-and-economic-growth.pdf' -OutFile 'publications/paid-basic-income-fertility-rates-and-economic-growth.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13023-geography-economics-and-political-systems-a-bird-s-eye-view.pdf' -OutFile 'publications/geography-economics-and-political-systems-a-bird-s-eye-view.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13032-brain-drain-and-development-traps.pdf' -OutFile 'publications/brain-drain-and-development-traps.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13016-non-linear-geographics-and-the-economics-of-transition-and-democratization.pdf' -OutFile 'publications/non-linear-geographics-and-the-economics-of-transition-and-democratization.pdf'"

REM Sixth batch - More Published Papers
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13186-why-are-us-universities-at-the-top-of-the-international-rankings.pdf' -OutFile 'publications/why-are-us-universities-at-the-top-of-the-international-rankings.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13185-the-consequences-to-the-banks-of-the-collapse-of-money-values-1931-and-2009-some-comments.pdf' -OutFile 'publications/the-consequences-to-the-banks-of-the-collapse-of-money-values-1931-and-2009-some-comments.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13055-can-demographic-transition-only-be-explained-by-altruistic-and-neo-malthusian-models.pdf' -OutFile 'publications/can-demographic-transition-only-be-explained-by-altruistic-and-neo-malthusian-models.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13057-focal-randomisation-an-optimal-mechanism-for-the-evaluation-of-r-d-projects.pdf' -OutFile 'publications/focal-randomisation-an-optimal-mechanism-for-the-evaluation-of-r-d-projects.pdf'"
powershell -Command "Invoke-WebRequest -Uri 'https://www.elisebrezis.com/publications/13154-disengagement-can-it-improve-the-palestinian-economy.pdf' -OutFile 'publications/disengagement-can-it-improve-the-palestinian-economy.pdf'"

echo.
echo Download completed! Check the publications folder for the PDF files.
pause
