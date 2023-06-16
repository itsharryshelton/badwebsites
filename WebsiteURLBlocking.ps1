#Code created by Harry Shelton & Michael Burr | 2023
$ITCompany = "Focus Group IT"
#Custom URL Block List - Remove the prefilled one, then add URLs like 'badwebsite.com','anotherwebsite.com' within the ()
$CustomURLArray = @('CustomURLsHere - Will Skip if this not removed')

# Invoke web request to download the file
$response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/itsharryshelton/badwebsites/main/BadWebsiteList.txt"
$content = $response.Content

# Split the content into an array of URLs
$urlArray = $content -split '\r?\n'


# =================================ACCESS BLOCKING OF CODE=================================

$chromeRegistryPath = "HKLM:\Software\Policies\Google\Chrome"
# Check if the Chrome registry path exists
if (-not (Test-Path $chromeRegistryPath)) {
    # Create the Chrome registry path if it doesn't exist
    New-Item -Path $chromeRegistryPath -Force | Out-Null
}

$ChromeBlacklistRegistryPath = "HKLM:\Software\Policies\Google\Chrome\URLBlacklist"
# Check if the URLBlacklist registry path exists
if (-not (Test-Path $ChromeBlacklistRegistryPath)) {
    # Create the URLBlacklist registry path if it doesn't exist
    New-Item -Path $ChromeBlacklistRegistryPath -Force | Out-Null
}


$edgeRegistryPath = "HKLM:\Software\Policies\Microsoft\Edge"
# Check if the Edge registry path exists
if (-not (Test-Path $edgeRegistryPath)) {
    # Create the Edge registry path if it doesn't exist
    New-Item -Path $edgeRegistryPath -Force | Out-Null
}

$EdgeBlacklistRegistryPath = "HKLM:\Software\Policies\Microsoft\Edge\URLBlacklist"
# Check if the URLBlacklist registry path exists
if (-not (Test-Path $EdgeBlacklistRegistryPath)) {
    # Create the URLBlacklist registry path if it doesn't exist
    New-Item -Path $EdgeBlacklistRegistryPath -Force | Out-Null
}

$FireFoxRegistryPath = "HKLM:\Software\Policies\Mozilla\Firefox\WebsiteFilter"
# Check if the Firefox registry path exists
if (-not (Test-Path $firefoxRegistryPath)) {
    # Create the Firefox registry path if it doesn't exist
    New-Item -Path $firefoxRegistryPath -Force | Out-Null
}


$FireFoxBlacklistRegistryPath = "HKLM:\Software\Policies\Mozilla\Firefox\WebsiteFilter\Block"
# Check if the URLBlacklist registry path exists
if (-not (Test-Path $FireFoxBlacklistRegistryPath)) {
    # Create the URLBlacklist registry path if it doesn't exist
    New-Item -Path $FireFoxBlacklistRegistryPath -Force | Out-Null
}



foreach ($url in $urlArray) {
    # Set the URL as a registry value for Google Chrome
    New-ItemProperty -Path "$chromeRegistryPath\URLBlacklist" -Name $urlArray.IndexOf($url) -Value $url -PropertyType "String"

    # Set the URL as a registry value for Microsoft Edge
    New-ItemProperty -Path "$edgeRegistryPath\URLBlacklist" -Name $urlArray.IndexOf($url) -Value $url -PropertyType "String"

    # Set the URL as a registry value for Firefox
    New-ItemProperty -Path "$FireFoxRegistryPath\Block" -Name $urlArray.IndexOf($url) -Value $url -PropertyType "String"
}


# Block Custom URLs part of the script
foreach ($url in $CustomURLArray) {
    if ($url -ne 'CustomURLsHere - Will Skip if this not removed') {
        # Set the URL as a registry value for Google Chrome
        New-ItemProperty -Path "$chromeRegistryPath\URLBlacklist" -Name $CustomURLArray.IndexOf($url) -Value $url -PropertyType "String"

        # Set the URL as a registry value for Microsoft Edge
        New-ItemProperty -Path "$edgeRegistryPath\URLBlacklist" -Name $CustomURLArray.IndexOf($url) -Value $url -PropertyType "String"

        # Set the URL as a registry value for Firefox
        New-ItemProperty -Path "$FireFoxRegistryPath\Block" -Name $CustomURLArray.IndexOf($url) -Value $url -PropertyType "String"
    }
}

# ================================= END OF ACCESS BLOCKING CODE =================================
<#
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#>
# ================================= NOTIFICATION BLOCKING OF CODE =================================

$NotiChromeRegistryPath = "HKLM:\Software\Policies\Google\Chrome"
# Check if the Chrome registry path exists
if (-not (Test-Path $NotiChromeRegistryPath)) {
    # Create the Chrome registry path if it doesn't exist
    New-Item -Path $NotiChromeRegistryPath -Force | Out-Null
}

$NotiChromeBlacklistRegistryPath = "HKLM:\Software\Policies\Google\Chrome\NotificationsBlockedForUrls"
# Check if the URLBlacklist registry path exists
if (-not (Test-Path $NotiChromeBlacklistRegistryPath)) {
    # Create the URLBlacklist registry path if it doesn't exist
    New-Item -Path $NotiChromeBlacklistRegistryPath -Force | Out-Null
}


$NotiEdgeRegistryPath = "HKLM:\Software\Policies\Microsoft\Edge"
# Check if the Edge registry path exists
if (-not (Test-Path $NotiEdgeRegistryPath)) {
    # Create the Edge registry path if it doesn't exist
    New-Item -Path $NotiEdgeRegistryPath -Force | Out-Null
}

$NotiEdgeBlacklistRegistryPath = "HKLM:\Software\Policies\Microsoft\Edge\NotificationsBlockedForUrls"
# Check if the URLBlacklist registry path exists
if (-not (Test-Path $NotiEdgeBlacklistRegistryPath)) {
    # Create the URLBlacklist registry path if it doesn't exist
    New-Item -Path $NotiEdgeBlacklistRegistryPath -Force | Out-Null
}

$NotiFireFoxRegistryPath = "HKLM:\Software\Policies\Mozilla\Firefox\Permissions\Notifications"
# Check if the Firefox registry path exists
if (-not (Test-Path $NotiFireFoxRegistryPath)) {
    # Create the Firefox registry path if it doesn't exist
    New-Item -Path $NotiFireFoxRegistryPath -Force | Out-Null
}


$NotiFireFoxBlacklistRegistryPath = "HKLM:\Software\Policies\Mozilla\Firefox\Permissions\Notifications\Block"
# Check if the URLBlacklist registry path exists
if (-not (Test-Path $NotiFireFoxBlacklistRegistryPath)) {
    # Create the URLBlacklist registry path if it doesn't exist
    New-Item -Path $NotiFireFoxBlacklistRegistryPath -Force | Out-Null
}

foreach ($url in $urlArray) {
    # Set the URL as a registry value for Google Chrome
    New-ItemProperty -Path "$NotiChromeRegistryPath\NotificationsBlockedForUrls" -Name $urlArray.IndexOf($url) -Value $url -PropertyType "String"

    # Set the URL as a registry value for Microsoft Edge
    New-ItemProperty -Path "$NotiEdgeRegistryPath\NotificationsBlockedForUrls" -Name $urlArray.IndexOf($url) -Value $url -PropertyType "String"

    # Set the URL as a registry value for Firefox
    New-ItemProperty -Path "$NotiFireFoxRegistryPath\Block" -Name $urlArray.IndexOf($url) -Value $url -PropertyType "String"
}


# Block Custom URLs part of the script
foreach ($url in $CustomURLArray) {
    if ($url -ne 'CustomURLsHere - Will Skip if this not removed') {
        # Set the URL as a registry value for Google Chrome
        New-ItemProperty -Path "$NotiChromeRegistryPath\NotificationsBlockedForUrls" -Name $CustomURLArray.IndexOf($url) -Value $url -PropertyType "String"

        # Set the URL as a registry value for Microsoft Edge
        New-ItemProperty -Path "$NotiEdgeRegistryPath\NotificationsBlockedForUrls" -Name $CustomURLArray.IndexOf($url) -Value $url -PropertyType "String"

        # Set the URL as a registry value for Firefox
        New-ItemProperty -Path "$NotiFireFoxRegistryPath\Block" -Name $CustomURLArray.IndexOf($url) -Value $url -PropertyType "String"
    }
}

#================================= END OF NOTIFICATION BLOCKING CODE =================================
<#
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#>

# Display a message box notification
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class CustomMessageBox
{
    [DllImport("user32.dll", CharSet = CharSet.Unicode)]
    public static extern int MessageBox(IntPtr hWnd, string text, string caption, uint type);
}
"@

$MessageBoxType = 0x4 # Displays the message box with the "Yes" and "No" buttons.

# Display the pop-up message box
$result = [CustomMessageBox]::MessageBox([IntPtr]::Zero, "This is an automatic notification from $ITCompany - We've deployed a change to your device that will fix your notification issues. A restart is required to ensure the policy has taken effect - Click Yes to Restart now", "Restart Required", $MessageBoxType)

# Check the user's choice
if ($result -eq 6) {
    Restart-Computer -Force
}