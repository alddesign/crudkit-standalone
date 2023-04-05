<# 
!!! Do not run. 
Administrative tool for building this archive.
I want that shit in the repo, cause i need it...
#>
cd $PSScriptRoot

#Run PHPdoc
cd "..\crudkit\vendor\alddesign\crudkit\doc\";
Write-Host "Create Phpdoc..." -ForegroundColor Yellow;
.\create_phpdoc.ps1

#Remove unwanted files
cd $PSScriptRoot
Write-Host "Deleting unwanted files..." -ForegroundColor Yellow;
Get-ChildItem -Path ..\crudkit\storage\framework\sessions -Exclude (".gitignore") | Remove-Item
Get-ChildItem -Path ..\crudkit\storage\framework\cache -Exclude (".gitignore") | Remove-Item -Recurse
Get-ChildItem -Path ..\crudkit\storage\framework\views -Exclude (".gitignore") | Remove-Item
Get-ChildItem -Path ..\crudkit\storage\logs -Exclude (".gitignore") | Remove-Item
Get-ChildItem -Path ..\crudkit\storage\crudkit -Recurse | Remove-Item
Remove-Item -ErrorAction Ignore -Path .\crudkit.zip

Write-Host "Creating Zip..." -ForegroundColor Yellow;
Set-Alias -Name 7z -Value 'C:\Program Files\7-Zip\7z.exe'
7z a -tzip ".\crudkit.zip" "..\crudkit" -xr@"exclude.txt"

Write-Host "Crudkit-Standalone created" -ForegroundColor Green;