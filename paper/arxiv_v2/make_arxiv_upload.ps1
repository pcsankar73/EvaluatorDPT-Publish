$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $here

$uploadName = "arxiv_upload.zip"
$uploadPath = Join-Path $here $uploadName

if (Test-Path $uploadPath) {
  Remove-Item -LiteralPath $uploadPath -Force
}

$include = @(
  "main.tex",
  "main.bbl",
  "references.bib",
  "*.png",
  "*.jpg",
  "*.jpeg",
  "*.pdf"
)

$exclude = @(
  "main.pdf",
  "README.md",
  "architecture_l2.png",
  "*.aux",
  "*.log",
  "*.out",
  "*.blg",
  "*.bbl~",
  "*.synctex.gz",
  "Reviewer-Comment-*",
  "reviewer_rating_synthesis.md",
  $uploadName
)

function MatchAny($path, $patterns) {
  foreach ($pat in $patterns) {
    if ($path -like $pat) { return $true }
  }
  return $false
}

$files = Get-ChildItem -File -Name | Where-Object { (MatchAny $_ $include) -and -not (MatchAny $_ $exclude) }

if (-not ($files -contains "main.tex")) { throw "Missing main.tex" }
if (-not ($files -contains "main.bbl")) { throw "Missing main.bbl (run bibtex first so arXiv can compile without bibtex)." }

Compress-Archive -Path $files -DestinationPath $uploadPath -Force

Write-Host "Wrote: $uploadPath"
Write-Host ("Included files:`n- " + ($files -join "`n- "))
