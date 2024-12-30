Invoke-Expression (&starship init powershell)

# Setting aliases for eza
function Show-EzaList { eza --icons --group-directories-first @args }
function Show-EzaListLong { eza --icons --group-directories-first -l @args }

# Set PowerShell aliases to these functions
Set-Alias -Name ls -Value Show-EzaList
Set-Alias -Name ll -Value Show-EzaListLong

# Run fastfetch on startup
fastfetch
