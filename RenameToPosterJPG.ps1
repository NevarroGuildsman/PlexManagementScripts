<#
.SYNOPSIS
Bulk renames poster images to poster.{extension} while moving them into the folder in the Plex media directory provided.
.DESCRIPTION
Plex custom poster support requires that the poster be named poster.{extension} when using subfolders within the media directory. Copying and renaming individual
posters can be a tedious and error prone task when adding them in bulk so I created a script to move them into the matching media folder and rename the 
poster as it is moved. Any posters that don't match a folder will be left in the source so the name can be adjusted and then the script run again.
.NOTES
PowerShell file created by GitHub user NevarroGuildsman. Licensed under MIT License.
August 06, 2022.
#>

function Set-PosterNames {
    [CmdletBinding(DefaultParameterSetName="PlexPosterRename", SupportsShouldProcess=$true)]
    param (
        [# The path on this machine that provides access to your Plex media.
        [Parameter(ParameterSetName='PlexPosterRename', Mandatory=$true, Position=0)]
        [string]
        $PlexMediaPath]
    )
    
}