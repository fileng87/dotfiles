function Invoke-Starship-TransientFunction {
    &starship module character
}

Invoke-Expression (&starship init powershell)
Enable-TransientPrompt

Invoke-Expression (& { (zoxide init powershell | Out-String) })
Invoke-Expression (& { (mise activate pwsh | Out-String) })

Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
function ls  { lsd @args }
function ll  { lsd -l @args }
function la  { lsd -a @args }
function lla { lsd -la @args }
function lt  { lsd --tree @args }
