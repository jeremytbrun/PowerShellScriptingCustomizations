#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'https://gist.githubusercontent.com/jeremytbrun/48319696b9858420ad6b7dcb8bccf057/raw/611cf484ce57d8dc5055b6fc92a2879720c2edae/prompt.json' | Invoke-Expression

if (-not (Get-Module -Name Terminal-Icons -ListAvailable)) {
    Install-Module -Name Terminal-Icons -Scope CurrentUser
}

if (-not (Get-Module -Name posh-git -ListAvailable)) {
    Install-Module -Name posh-git -Scope CurrentUser
}

if (-not (Get-Module -Name VSTeam -ListAvailable)) {
    Install-Module -Name posh-git -Scope CurrentUser
}

$env:VSTEAM_NO_MODULE_MESSAGES = $true
$PersonalAccessToken = "tls2xg45utnzbhfsm2bufgu3lblhowivjvu44tkzxrfypayhzoqa"
Set-VSTeamAccount -Account mi-jis -PersonalAccessToken $PersonalAccessToken -Drive mi-jis | Invoke-Expression | Out-Null

Import-Module -Name Terminal-Icons
Import-Module -Name posh-git

if (Test-Path "$env:USERPROFILE\source\repos") {
    Set-Location "$env:USERPROFILE\source\repos"
}
