import XMonad

import XMonad.Config.Xfce
import XMonad.Hooks.EwmhDesktops (fullscreenEventHook)
-- import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
-- import XMonad.Layout.Tabbed (simpleTabbed)
-- import XMonad.Util.EZConfig (additionalKeys)

-- Fixes issue with Chromium F11 fullscreen
myHandleEventHook = fullscreenEventHook

myManageHook = composeAll
    [ className =? "Xfce4-appfinder" --> doFloat
    , className =? "Xfrun4"          --> doFloat
    , className =? "Gimp"            --> doFloat
    -- , isFullscreen                   --> doFullFloat
    ]

main = xmonad $ xfceConfig
    { modMask = mod4Mask
    , terminal = "xfce4-terminal"
    , borderWidth = 2
    , normalBorderColor = "#222E38"
    , focusedBorderColor = "#85939E"
    -- , workspaces = ["1","2","3","4"]
    -- , layoutHook = simpleTabbed ||| layoutHook xfceConfig
    , handleEventHook = myHandleEventHook <+> handleEventHook xfceConfig
    , manageHook = myManageHook <+> manageHook xfceConfig
    , startupHook = do
          startupHook xfceConfig
          -- Fixes issue with xfce4-panel vanishing on XMonad startup
          spawn "kill $(pgrep xfce4-panel)"
    }
    -- `additionalKeys` [ ((mod4Mask, xK_F1), spawn "firefox") ]
