(&mise activate pwsh) | Out-String | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
function ls  { lsd @args }
function ll  { lsd -l @args }
function la  { lsd -a @args }
function lla { lsd -la @args }
function lt  { lsd --tree @args }

oh-my-posh init pwsh --config "$HOME/.config/oh-my-posh/p10k-lean-frame.omp.json" | Invoke-Expression
