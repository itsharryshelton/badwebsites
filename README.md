Blocking Websites – Machine Level
A script that will look forcefully add a block to websites, pulling from a pre-made list of known bad websites, adds in registry keys to block access/notifications for Chrome, Edge and Firefox and also allows for custom URLs to be added in. Then will prompt a restart for the user, can adjust IT company name for company or support specific branding.

Link to Script: https://github.com/itsharryshelton/badwebsites/blob/main/WebsiteURLBlocking.ps1

The powershell by default will by default pull from this pre-made list I put together: https://github.com/itsharryshelton/badwebsites/blob/main/BadWebsiteList.txt

If you want to specifically reference a different text file on a WebRequest, you need to edit line 7:

"
$response = Invoke-WebRequest -Uri “https://raw.githubusercontent.com/itsharryshelton/badwebsites/main/BadWebsiteList.txt”
$content = $response.Content
"

To change what company branding name you want, change the $ITCompany variable on line 2

Line 4 is your custom URL variable, include any specific URLs you want to add here, it will still run the pre-made txt file. Due to this script being designed to be run completely without the user knowing in the background via a RMM Deployment etc


If you want to stop certain parts of the script, you will need to edit the template, I recommend commenting out certain parts of the script you don’t need so it doesn’t break any calling of variables if you change your mind.


This script isn’t signed yet, so if you have any policies or issues with running it, you may need to set the script execution before hand, I didn’t add this to the script to conflict with anyone’s policies:

set-executionpolicy unrestricted

This script only works for:

Firefox
Edge
Chrome

Has been tested working on Windows 11 Pro, it works by injecting the block registries to:
Website Blocking:
HKLM:\Software\Policies\Google\Chrome\URLBlacklist
HKLM:\Software\Policies\Microsoft\Edge\URLBlacklist
HKLM:\Software\Policies\Mozilla\Firefox\WebsiteFilter\Block

Notification Blocking:
HKLM:\Software\Policies\Google\Chrome\NotificationsBlockedForUrls
HKLM:\Software\Policies\Microsoft\Edge\NotificationsBlockedForUrls
HKLM:\Software\Policies\Mozilla\Firefox\Permissions\Notifications\Block

Because this is injecting straight into the machine level of the registry keys, for it to ensure it works correctly, the machine will need a restart, the end of the script will prompt the user to restart, clicking yes will force a restart – please remove this if you don’t want the user to know an update took place. (Lines 175-195)

This does allow this blocking policy to work on any local, domain or Entra account, no matter if they can reach a server for a GPO update or user signed in a local account on a domain joined PC.
