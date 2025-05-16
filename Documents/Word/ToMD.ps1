# Converts all .docx files in this folder to .md files in the parent folder using Pandoc

$wordFiles = Get-ChildItem -Filter *.docx
foreach ($file in $wordFiles) {
    $mdName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name) + ".md"
    $mdPath = Join-Path -Path (Split-Path -Parent $PSScriptRoot) -ChildPath $mdName
    pandoc $file.FullName -o $mdPath
}
