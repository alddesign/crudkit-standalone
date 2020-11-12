#Run PHPdoc cmd
cd $PSScriptRoot
Write-Host "Create Phpdoc..." -ForegroundColor Yellow;
cd "..\crudkit\vendor\alddesign\crudkit\doc\";
.\create_phpdoc.ps1
cd $PSScriptRoot

#Remove unwanted files
Write-Host "Deleting unwanted files..." -ForegroundColor Yellow;
Get-ChildItem -Path ..\crudkit\storage\framework\sessions -Exclude (".gitignore") | Remove-Item
Get-ChildItem -Path ..\crudkit\storage\framework\cache -Exclude (".gitignore") | Remove-Item
Get-ChildItem -Path ..\crudkit\storage\framework\views -Exclude (".gitignore") | Remove-Item
Get-ChildItem -Path ..\crudkit\storage\logs -Exclude (".gitignore") | Remove-Item
Get-ChildItem -Path ..\crudkit\storage\crudkit | Remove-Item
Remove-Item -ErrorAction Ignore -Path .\crudkit.zip

Write-Host "Creating Zip..." -ForegroundColor Yellow;
Set-Alias -Name 7z -Value 'C:\Program Files\7-Zip\7z.exe'
7z a -tzip ".\crudkit.zip" "..\crudkit" -xr@"exclude.txt"

Write-Host "Crudkit-Standalone created" -ForegroundColor Green;
Read-Host