--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
 
import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.EwmhDesktops
import XMonad.Prompt
import XMonad.Prompt.Workspace
import XMonad.Prompt.DirExec
import XMonad.Actions.CycleWS
import XMonad.Actions.WindowBringer
import XMonad.Actions.UpdatePointer
import XMonad.Actions.Volume
import XMonad.Layout.Dishes
import XMonad.Layout.Accordion
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.PerWorkspace
import XMonad.Layout.MagicFocus
import XMonad.Layout.Named
import XMonad.Layout.IM
import XMonad.Layout.Reflect
import XMonad.Util.EZConfig
import XMonad.Util.Run
import System.Exit

import Data.Map    (fromList)
import Data.Monoid (mappend)
 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import System.IO.UTF8

-- Control Center
-- Colour scheme
myNormalBGColor     = "#36648b"
myFocusedBGColor    = "#4682b4"
myNormalFGColor     = "#ffffff"
myFocusedFGColor    = "green"
mySeperatorColor    = "#2e3436"
-- 
myFont = "-*-proggyclean-*-*-*-*-*-80-*-*-*-*-*-*"

-- Dzen status bar
dzenDefaults =    " -ta l"
              ++  " -bg '" ++ myNormalBGColor
              ++ "' -fg '" ++ myNormalFGColor
              ++ "' -fn '" ++ myFont
              ++ "' -sa c"
              ++  " -y 0"

dzenXmonad     = "dzen2 -p -w 750" ++ dzenDefaults
dzenStatusBar  = "~/.xmonad/dzen/statusline.rb | dzen2 -p -x 750 -w 274" ++ dzenDefaults

dmenuOptions = "-b -fn " ++ myFont
              ++ " -nf " ++ myNormalFGColor 
              ++ " -nb " ++ myNormalBGColor 
              ++ " -sf " ++ myFocusedFGColor
              ++ " -sb " ++ myFocusedBGColor 

myDmenu = "exe=`dmenu_path | dmenu " ++ dmenuOptions ++ "` && eval \"exec $exe\""

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "urxvt"
 
-- Width of the window border in pixels.
--
myBorderWidth   = 1
 
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod1Mask
 
-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
myNumlockMask   = mod2Mask

-- float percent status (for volume)
volalert = dzenConfig centered . show . round centered =
        onCurr (center 150 66)
    >=> font "-*-helvetica-*-r-*-*-64-*-*-*-*-*-*-*"
    >=> addArgs ["-fg", "#80c0ff"]
    >=> addArgs ["-bg", "#000040"]


 
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
-- myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]
-- myWorkspaces = ["1:α","2:β","3:γ","4:δ","5:ε","6:ζ"]
-- myWorkspaces = ["1:Α","2:Β","3:Γ","4:Δ","5:Ε","6:Ζ"]
myWorkspaces =    ["1:alpha", "2:beta", "3:gamma", "4:delta", "5:epsilon"] 
               ++ ["6:zeta",  "7:eta",  "8:theta", "9:iota",  "0:kappa"]
-- myWorkspaces =    ["1:α", "2:β", "3:γ", "4:δ", "5:ε"]
--                ++ ["6:ζ", "7:η", "8:θ", "9:ι", "0:κ"]
 
-- Border colors for unfocused and focused windows, respectively.
--
-- myNormalBorderColor  = "#cccccc"
-- myFocusedBorderColor = "#cd8b00"
 
-- Default offset of drawable screen boundaries from each physical
-- screen. Anything non-zero here will leave a gap of that many pixels
-- on the given edge, on the that screen. A useful gap at top of screen
-- for a menu bar (e.g. 15)
--
-- An example, to set a top gap on monitor 1, and a gap on the bottom of
-- monitor 2, you'd use a list of geometries like so:
--
-- > defaultGaps = [(18,0,0,0),(0,18,0,0)] -- 2 gaps on 2 monitors
--
-- Fields are: top, bottom, left, right.
--
-- obsolete:
-- myDefaultGaps   = [(0,15,0,0)]
 
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    -- launch a terminal
    [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
 
    -- launch dmenu
    , ((modMask,               xK_p     ), spawn myDmenu)
 
    -- launch gmrun
    , ((modMask .|. shiftMask, xK_p     ), spawn "gmrun")
 
    -- close focused window 
    , ((modMask .|. shiftMask, xK_c     ), kill)
 
     -- Rotate through the available layout algorithms
    , ((modMask,               xK_space ), sendMessage NextLayout)
 
    --  Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
 
    -- Resize viewed windows to the correct size
    , ((modMask,               xK_n     ), refresh)
 
    -- Move focus to the next window
    , ((modMask,               xK_Tab   ), windows W.focusDown)
 
    -- Move focus to the next window
    , ((modMask,               xK_j     ), windows W.focusDown)
 
    -- Move focus to the previous window
    , ((modMask,               xK_k     ), windows W.focusUp  )
 
    -- Move focus to the master window
    , ((modMask,               xK_m     ), windows W.focusMaster  )
 
    -- Swap the focused window and the master window
    , ((modMask,               xK_Return), windows W.swapMaster)
 
    -- Swap the focused window with the next window
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )
 
    -- Swap the focused window with the previous window
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )
 
    -- Shrink the master area
    , ((modMask,               xK_h     ), sendMessage Shrink)
 
    -- Expand the master area
    , ((modMask,               xK_l     ), sendMessage Expand)
 
    -- Push window back into tiling
    , ((modMask,               xK_m     ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modMask .|. shiftMask , xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modMask .|. shiftMask , xK_period), sendMessage (IncMasterN (-1)))
 
    -- toggle the status bar gap
    -- old -> xmond <= 0.6
    -- , ((modMask              , xK_b     ),
    --       modifyGap (\i n -> let x = (XMonad.defaultGaps conf ++ repeat (0,0,0,0)) !! i
    --                          in if n == x then (0,0,0,0) else x))
    -- new -> xmond 0.8
    , ((modMask              , xK_b     ), sendMessage ToggleStruts)
 
    -- Quit xmonad
    , ((modMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modMask              , xK_q     ),
          broadcastMessage ReleaseResources >> restart "xmonad" True)

    -- Prompt for a workspace
    , ((modMask .|. shiftMask, xK_t     ), workspacePrompt defaultXPConfig (windows . W.shift))

    -- Wmii Actions
    , ((modMask,               xK_a     ), dirExecPromptNamed defaultXPConfig spawn 
                                                              "~/.xmonad/actions/" "Scripts: ")

    -- Cycle workspaces
    -- With DynamicWindows
    -- , ((modMask ,               xK_period), nextWS)
    -- , ((modMask ,               xK_comma),  prevWS)
    -- With RotView
    , ((modMask ,               xK_period), moveTo Next NonEmptyWS)
    , ((modMask ,               xK_comma),  moveTo Prev NonEmptyWS)
    -- , ((modMask x .|. shiftMask, xK_Right), shiftToNext)
    -- , ((modMask x .|. shiftMask, xK_Left),  shiftToPrev)
    , ((modMask ,               xK_r),     toggleWS)

    -- Window bringer
    , ((modMask .|. shiftMask, xK_g     ), gotoMenu)
    , ((modMask .|. shiftMask, xK_b     ), bringMenu)
    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    -- Xinerama stuff
    ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3 -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3 --
    -- [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
    --    | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
    --    , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_e, xK_w] [0..]
       , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 

    -- volume controls

        ((modMask, xK_F6), lowerVolume 4 >>= volalert),
        ((modMask, xK_F7), raiseVolume 4 >>= volalert)

        ((modMask, xK_F10), toggleMute >>= volalert),
 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
 
------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts (noBorders (tabbed shrinkText myTConf)
            ||| Mirror tiled
            ||| mfocus 
            ||| noBorders Full 
            ||| tiled)
  where
     -- Magic Focus
     mfocus = named "Magic Focus" (magicFocus (Mirror tiled))

     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1
 
     -- Default proportion of screen occupied by master pane
     ratio   = 4/6
 
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

     -- Set tabsize for tabbed layout
     -- myTConf = defaultTheme { tabSize = 12 }
     myTConf = defaultTheme { decoHeight = 12 }
 
------------------------------------------------------------------------
-- Window rules:
 
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> withIM (0.11) (Role "gimp-toolbox") $
                                        reflectHoriz $
                                        withIM (0.15) (Role "gimp-dock") Full
    , className =? "Firefox-bin"    --> doF (W.shift "8:theta")
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ] <+> manageDocks
 
 
------------------------------------------------------------------------
-- Status bars and logging
 
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--
myLogHook h = (dynamicLogWithPP (myPP h)) >> updatePointer Nearest

myPP h = defaultPP 
         { ppCurrent         = wrap "^bg(#e5f9ff)^fg(#105468)" "^bg()^fg()"
         , ppVisible         = wrap "^fg(#a00000)" "^fg()"
         , ppHidden          = wrap "^fg(#ffffff)" "^fg()"
         , ppHiddenNoWindows = wrap "^fg(#7eacb9)" "^fg()"
         , ppSep             = " | "
         , ppWsSep           = "  "
         , ppTitle           = shorten 80
         , ppOrder           = (take 3) . workspaceTag
         , ppOutput          = hPutStrLn "/usr/bin/xmobar ~/.xmonad/xmobar"
         }
    where workspaceTag (x:xs) = ("[ " ++ x ++ " ]") : xs

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
 
-- Run xmonad with the settings you specify. No need to modify this.
--
main = do dzenh <- spawnPipe dzenXmonad
          spawn dzenStatusBar
          spawn "unclutter -idle 3"
          spawn "syndaemon -t -i 2"
          spawn "xscreensaver -nosplash"
          spawn "xsetroot -cursor_name left_ptr"
          spawn "xset r rate 250 30"
          spawn "xset m 5 1"
          xmonad $ defaults dzenh
 
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will 
-- use the defaults defined in xmonad/XMonad/Config.hs
-- 
-- No need to modify this.
--
defaults dzenh = defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalFGColor,
        focusedBorderColor = myFocusedFGColor,
        -- obsolete:
        -- defaultGaps        = myDefaultGaps,
 
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
 
      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        -- Lie about WM Name to make Java programs run
        startupHook        = setWMName "LG3D",
        logHook            = myLogHook dzenh

        handleEventHook    = fullscreenEventHook
    }
