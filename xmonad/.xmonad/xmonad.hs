import XMonad

import XMonad.Config.Xfce
import XMonad.Hooks.EwmhDesktops (ewmhDesktopsEventHook, fullscreenEventHook)
import XMonad.Hooks.ManageHelpers (isFullscreen, doCenterFloat, doFullFloat)
import XMonad.Layout.LayoutHints (hintsEventHook)
-- import XMonad.Layout.Tabbed (simpleTabbed)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Fullscreen (fullscreenManageHook)
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
import XMonad.Actions.CycleWS (toggleWS, prevWS, nextWS, shiftToPrev, shiftToNext)

-- Windows/Super key
myModMask = mod4Mask

myWorkspaces = ["1","2","3","4"]

myHandleEventHook = ewmhDesktopsEventHook <+> fullscreenEventHook <+> hintsEventHook

myManageHook = composeAll . concat $
    [ [ className =? c --> doCenterFloat | c <- cFloats ]
    , [ title     =? t --> doCenterFloat | t <- tFloats ]
    , [ className =? c --> doFullFloat   | c <- cFullFloats ]
    , [ isFullscreen --> doFullFloat ]
    ]
  where cFloats = ["VirtualBox", "Gimp", "Xfrun4", "Xfce4-appfinder"]
        tFloats = ["File Operation Progress", "Float"]
        cFullFloats = ["Zeal"]

myKeys =
    [ ("M-f", spawn "firefox")
    , ("M-c", spawn "chromium")
    , ("M-S-z", spawn "zeal")
    , ("M-p", spawn "rofi -show drun")
    , ("M-S-l", spawn "dm-tool lock")
    , ("M-<Escape>", toggleWS)
    , ("M-<Left>", prevWS)
    , ("M-<Right>", nextWS)
    , ("M-S-<Left>", shiftToPrev >> prevWS)
    , ("M-S-<Right>", shiftToNext >> nextWS)
    ] ++
    [ (otherModMasks ++ "M-" ++ [key], action tag) | (tag, key) <- zip myWorkspaces "123456789"
    , (otherModMasks, action) <-
        [ ("", windows . W.view) -- was W.greedyView
        , ("S-", windows . W.shift)
        ]
    ]

myMouseBindings =
  [ ((myModMask, 6 :: Button), (\w -> focus w >> prevWS))
  , ((myModMask, 7 :: Button), (\w -> focus w >> nextWS))
  , ((myModMask .|. shiftMask, 6 :: Button), (\w -> focus w >> shiftToPrev >> prevWS))
  , ((myModMask .|. shiftMask, 7 :: Button), (\w -> focus w >> shiftToNext >> nextWS))
  ]

main = xmonad $ xfceConfig
    { modMask = myModMask
    , terminal = "xfce4-terminal"
    , borderWidth = 4
    , normalBorderColor = "#222E38"
    , focusedBorderColor = "#85939E"
    -- , workspaces = myWorkspaces
    , layoutHook = smartBorders $ layoutHook xfceConfig
    , handleEventHook = myHandleEventHook <+> handleEventHook xfceConfig
    , manageHook = myManageHook <+> manageHook xfceConfig <+> fullscreenManageHook
    , startupHook = do
        startupHook xfceConfig
        -- Fixes issue with xfce4-panel vanishing on XMonad startup
        spawn "kill -9 $(pgrep xfce4-panel)"
    }
    `additionalKeysP` myKeys
    `additionalMouseBindings` myMouseBindings
