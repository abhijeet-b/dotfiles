import XMonad

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Layout.Spacing
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import Graphics.X11.ExtraTypes.XF86

normalBorderColor, focusedBordercolor :: String
normalBorderColor = "black"
focusedBordercolor = "indigo"

main :: IO ()
main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     =<< statusBar "xmobar" def toggleStrutsKey myConfig
  where
     toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
     toggleStrutsKey XConfig { modMask = m } = (m, xK_b)

myConfig = def
	{ modMask = mod4Mask
	, startupHook = myStartupHook
 	, layoutHook = spacingWithEdge 10 
	$ myLayout
	, XMonad.focusedBorderColor = focusedBordercolor 
	}
	`additionalKeysP`
	[ -- ("M-]"			, spawn "firefox"	), 
	("M-<Return>"			, spawn "wezterm"	)
	, ("M-d"			, spawn "rofi -show drun")
	, ("M-v"			, spawn "pavucontrol")
 	, ("M-S-q"			, spawn "rofi -show power-menu -modi power-menu:$HOME/.apps/rofi-power-menu/rofi-power-menu")
        , ("M-e"			, spawn "xmonad --recompile; xmonad --restart")
        , ("M-S-l"			, spawn "xsecurelock")
 	, ("M-q"			, kill)
 	, ("M-S-r"			, spawn "./.hdmi.sh") 
 	, ("<XF86MonBrightnessUp>"	, spawn "lux -a 4%")
 	, ("<XF86MonBrightnessDown>"	, spawn "lux -s 4%")
 	, ("<XF86AudioMute>"		, spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
 	, ("<XF86AudioRaiseVolume>"	, spawn "pactl set-sink-volume @DEFAULT_SINK@ +3%")
 	, ("<XF86AudioLowerVolume>"	, spawn "pactl set-sink-volume @DEFAULT_SINK@ -3%")
      	, ("<Print>"			, spawn "flameshot screen -p Pictures/Screenshots/")
      	, ("M-w"			, spawn "flameshot gui")
      	, ("M-<F1>"			, spawn "./.kbd.sh")
	]

myLayout = tiled ||| Mirror tiled ||| Full
   where
	threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
   	tiled	= Tall nmaster delta ratio
	nmaster = 1
	ratio = 1/2
	delta = 3/100

myStartupHook :: X ()
myStartupHook = do
	spawn "feh --bg-scale /home/jeet/Downloads/wall.jpg"
	spawn "xinput set-prop 11 340 1"
