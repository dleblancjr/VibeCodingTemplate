# Converts all Markdown documents in this directory to Word (.docx) format in the Word subfolder using Pandoc

$env:Path += ";$((Get-Command pandoc).Source | Split-Path)"; 

$markDownFiles = Get-ChildItem -Filter *.md
foreach ($file in $markDownFiles) {
    $wordName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name) + ".docx"
    $wordPath = Join-Path -Path (Split-Path -Parent $PSScriptRoot) -ChildPath $wordName
    pandoc $file.FullName -o $wordPath
}
