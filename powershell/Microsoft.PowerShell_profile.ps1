Invoke-Expression (&starship init powershell)

# Setting aliases for eza
function Show-EzaList { eza --icons --group-directories-first @args }
function Show-EzaListLong { eza --icons --group-directories-first -l @args }

# Set PowerShell aliases to these functions
Set-Alias -Name ls -Value Show-EzaList
Set-Alias -Name ll -Value Show-EzaListLong

# Setting aliases for yt-dlp
function dvid {
    yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]' -o "%(title)s.%(ext)s" $args
}

function dwav {
    yt-dlp -x --audio-format wav $args
}

# Run fastfetch on startup
fastfetch
