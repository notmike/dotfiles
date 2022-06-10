-- https://apple.stackexchange.com/questions/70985/make-the-menu-bar-never-show-while-in-full-screen

use framework "AppKit"
use scripting additions

repeat with runningApp in current application's NSWorkspace's sharedWorkspace's runningApplications()
    if runningApp's isActive()
        set frontApp to (localizedName of runningApp) as text
        exit repeat
    end if
end repeat

tell application "System Events"
    tell process frontApp to set isFullScreen to value of attribute "AXFullScreen" of first window
    if frontApp = "Finder"
        tell process frontApp to set value of attribute "AXFullScreen" of first window to not isFullScreen
    else if isFullScreen
        do shell script "lsappinfo setinfo -app " & quoted form of frontApp & " ApplicationType=Foreground"
        tell process frontApp to set value of attribute "AXFullScreen" of first window to false

        (*fix to make sure the menu bar is not stuck*)
        delay 0.42
        tell application "Finder" to activate
        tell process frontApp to set frontmost to true
    else
        do shell script "lsappinfo setinfo -app " & quoted form of frontApp & " ApplicationType=UIElement"
        tell process frontApp to set value of attribute "AXFullScreen" of first window to true
    end if
end tell

