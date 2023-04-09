<# 
!!! Do not run. 
Administrative tool for building this archive.
I want that shit in the repo, cause, ...i need it...
#>

# CONFIG -------------------------------------------------------------------------------------------------------
$makeApiDoc = $true;
$makeApiDocDir = "..\crudkit\vendor\alddesign\crudkit\make-api-doc"; #Path to the api-doc building dir
$makeApiDocPs1 = ".\make-api-doc.ps1"; #Name of the powershell script in that folder, use .\ syntax
$7zipExe = 'C:\Program Files\7-Zip\7z.exe';

#Building the api-doc, make sure its up to date:
if($makeApiDoc)
{
    cd $makeApiDocDir;
    Write-Host "Creating api-doc..." -ForegroundColor Yellow;
    . $makeApiDocPs1;
}

#Remove unwanted files
cd $PSScriptRoot
Write-Host "Deleting hot files..." -ForegroundColor Yellow;
Remove-Item -Path "..\crudkit\storage\framework\sessions\*" -Recurse -Exclude "*.gitignore" -ErrorAction SilentlyContinue;
Remove-Item -Path "..\crudkit\storage\framework\cache\*" -Recurse -Exclude "*.gitignore" -ErrorAction SilentlyContinue;
Remove-Item -Path "..\crudkit\storage\framework\views\*" -Recurse -Exclude "*.gitignore" -ErrorAction SilentlyContinue;
Remove-Item -Path "..\crudkit\storage\logs\*" -Recurse -Exclude "*.gitignore" -ErrorAction SilentlyContinue;
Remove-Item -Path "..\crudkit\storage\crudkit\*" -Recurse -ErrorAction SilentlyContinue;
Remove-Item -LiteralPath ".\crudkit.zip" -ErrorAction SilentlyContinue;

Write-Host "Creating Zip..." -ForegroundColor Yellow;
Set-Alias -Name 7z -Value $7zipExe;

#Most fucked up cli syntax...
#7z a -t7z ".\crudkit.7z" "..\crudkit" -xr@"exclude.txt"
7z a -tzip ".\crudkit.zip" "..\crudkit" -xr@"exclude.txt"

Write-Host "Crudkit-Standalone created" -ForegroundColor Green;