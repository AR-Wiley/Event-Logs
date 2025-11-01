
function GetSystemInfo {

    param (
    
        [string]$logname_warning = "System",
        [datetime]$first_warning = (Get-Date).AddDays(-1),
        [datetime]$last_warning = (Get-Date),
        [string]$logname_error = "System",
        [datetime]$first_error = (Get-Date).AddDays(-7),
        [datetime]$last_error = (Get-Date)

    )

    $filterhashtable_warning = @{
    
    Logname = $logname_warning
    StartTime = $first_warning
    EndTime = $last_warning

    }

    $filterhashtable_error = @{
    
    Logname = $logname_error
    StartTime = $first_error
    EndTime = $last_error

    }

    $warning_events = Get-WinEvent -FilterHashtable $filterhashtable_warning | Where-Object {$_.LevelDisplayName -eq "Warning" } | Select-Object TimeCreated,Id,LevelDisplayName,Level,Message 

    $error_events =  Get-WinEvent -FilterHashtable $filterhashtable_error | Where-Object {$_.LevelDisplayName -eq "Error" } | Select-Object TimeCreated,Id,LevelDisplayName,Level,Message 

    Write-Output "System Warning Events over the last Day: " 
    $warning_events | Format-Table -AutoSize
    Write-Output "System Error Events over the last seven Days: " 
    $error_events | Format-Table -AutoSize 

}

function GetApplicationInfo {

    param (
    
        [string]$logname_warning = "Application",
        [datetime]$first_warning = (Get-Date).AddDays(-1),
        [datetime]$last_warning = (Get-Date),
        [string]$logname_error = "Application",
        [datetime]$first_error = (Get-Date).AddDays(-7),
        [datetime]$last_error = (Get-Date)

    )

    $filterhashtable_warning = @{
    
    Logname = $logname_warning
    StartTime = $first_warning
    EndTime = $last_warning

    }

    $filterhashtable_error = @{
    
    Logname = $logname_error
    StartTime = $first_error
    EndTime = $last_error
    }

    $warning_events = Get-WinEvent -FilterHashtable $filterhashtable_warning | Where-Object {$_.LevelDisplayName -eq "Warning" } | Select-Object TimeCreated,Id,LevelDisplayName,Level,Message 

    $error_events =  Get-WinEvent -FilterHashtable $filterhashtable_error | Where-Object {$_.LevelDisplayName -eq "Error" } | Select-Object TimeCreated,Id,LevelDisplayName,Level,Message 

    Write-Output "Application Warning Events over the last Day: " 
    $warning_events | Format-Table -AutoSize
    Write-Output "Application Error Events over the last seven Days: " 
    $error_events | Format-Table -AutoSize 

}

GetSystemInfo
GetApplicationInfo
