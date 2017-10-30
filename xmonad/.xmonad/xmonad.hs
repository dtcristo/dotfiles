import XMonad

import XMonad.Config.Xfce
import XMonad.Hooks.EwmhDesktops (fullscreenEventHook)
import XMonad.Hooks.ManageHelpers (doCenterFloat)
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
-- import XMonad.Layout.Tabbed (simpleTabbed)
import XMonad.Layout.NoBorders (smartBorders)
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (additionalKeysP)

-- Windows/Super key
myModMask = mod4Mask

myWorkspaces = ["1","2","3","4"]

-- Fixes issue with Chromium F11 fullscreen
myHandleEventHook = fullscreenEventHook

myManageHook = composeAll . concat $
    [ [ className =? c --> doCenterFloat | c <- cFloats ]
    , [ title     =? t --> doCenterFloat | t <- tFloats ]
    --, [ isFullscreen --> doFullFloat ]
    ]
  where cFloats = ["VirtualBox", "Gimp", "Xfrun4", "Xfce4-appfinder"]
        tFloats = ["File Operation Progress", "Float"]

myKeys =
    [ ("M-f", spawn "firefox-beta")
    , ("M-c", spawn "chromium")
    , ("M-p", spawn "rofi -show drun")
    ] ++
    [ (otherModMasks ++ "M-" ++ [key], action tag) | (tag, key) <- zip myWorkspaces "123456789"
    , (otherModMasks, action) <-
        [ ("", windows . W.view) -- was W.greedyView
        , ("S-", windows . W.shift)
        ]
    ]

main = xmonad $ xfceConfig
    { modMask = myModMask
    , terminal = "xfce4-terminal"
    , borderWidth = 3
    , normalBorderColor = "#222E38"
    , focusedBorderColor = "#85939E"
    -- , workspaces = myWorkspaces
    , layoutHook = smartBorders $ layoutHook xfceConfig
    , handleEventHook = myHandleEventHook <+> handleEventHook xfceConfig
    , manageHook = myManageHook <+> manageHook xfceConfig
    , startupHook = do
        startupHook xfceConfig
        -- Fixes issue with xfce4-panel vanishing on XMonad startup
        spawn "kill -9 $(pgrep xfce4-panel)"
    }
    `additionalKeysP` myKeys
