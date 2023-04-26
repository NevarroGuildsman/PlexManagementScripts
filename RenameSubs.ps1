# Prompt user to enter language name
$language = Read-Host "Enter the name of a language"

# Find all files containing the language name
$files = Get-ChildItem -Recurse -Filter "*$language*"

# Group files by parent folder
$groups = $files | Group-Object -Property Directory

# Loop through each group
foreach ($group in $groups) {
    # Find the largest file size in the group
    $largestSize = ($group.Group | Measure-Object -Property Length -Maximum).Maximum

    # Loop through each file in the group
    foreach ($file in $group.Group) {
        # Check if file size is less than 5KB
        if ($file.Length -lt 5kb) {
            # Rename file with (Forced) before the extension
            Rename-Item -Path $file.FullName -NewName ($file.basename + '(Forced)' + $file.extension)
        }
        # Check if file size is equal to the largest file size in the group
        elseif ($file.Length -eq $largestSize) {
            # Rename file with (SDH) before the extension
            Rename-Item -Path $file.FullName -NewName ($file.basename + '(SDH)' + $file.extension)
        }
    }
}