-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- $ hyprctl monitors
-- Monitor eDP-1 (ID 0):
-- 	1920x1200@60.00300 at 0x0
-- 	description: Lenovo Group Limited 0x41B5
-- 	make: Lenovo Group Limited
-- 	model: 0x41B5
-- 	physical size (mm): 340x220
-- 	serial: 
-- 	active workspace: 1 (1)
-- 	special workspace: 0 ()
-- 	reserved: 0 51 0 0
-- 	scale: 1.50
-- 	transform: 0
-- 	focused: yes
-- 	dpmsStatus: 1
-- 	vrr: false
-- 	solitary: 0
-- 	solitaryBlockedBy: windowed mode,missing candidate
-- 	activelyTearing: false
-- 	tearingBlockedBy: next frame is not torn,user settings,missing candidate
-- 	directScanoutTo: 0
-- 	directScanoutBlockedBy: user settings,missing candidate
-- 	disabled: false
-- 	currentFormat: XRGB8888
-- 	mirrorOf: none
-- 	availableModes: 1920x1200@60.00Hz 1920x1080@60.00Hz 1600x1200@60.00Hz 1680x1050@60.00Hz 1280x1024@60.00Hz 1440x900@60.00Hz 1280x800@60.00Hz 1280x720@60.00Hz 1024x768@60.00Hz 800x600@60.00Hz 640x480@60.00Hz 
-- 	colorManagementPreset: srgb
-- 	sdrBrightness: 1.00
-- 	sdrSaturation: 1.00
-- 	sdrMinLuminance: 0.20
-- 	sdrMaxLuminance: 80
--
hl.monitor({
    output   = "desc:Lenovo Group Limited 0x41B5",
    mode     = "1920x1200@60",
    position = "0x0",
    scale    = "1.33",
})
hl.monitor({
    output   = "desc:NEC Corporation E233WM 5Z103945NB",
    mode     = "1920x1080@60",
    position = "1443x-200",
    scale    = "1",
    transform= 1,  -- turned 90 degrees to the right
})
hl.monitor({
    output   = "desc:Lenovo Group Limited LEN S28u-10 VNA4ZZXC",
    mode     = "3840x2160@60",
    position = "2523x190",
    scale    = "1.5",
})
hl.monitor({
    output   = "desc:NEC Corporation E233WM 5Z103955NB",
    mode     = "1920x1080@60",
    position = "5083x220",
    scale    = "1",
})
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
-- hl.monitor({
--     output   = "",
--     mode     = "preferred",
--     position = "auto",
--     scale    = "1",
--     mirror    = "eDP-1",
-- })
-- hl.monitor({
--     output   = "desc:HXA BMD HDMI 0x00000001",
--     mode     = "1920x1080@60",
--     position = "5083x220",
--     scale    = "1",
-- })


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "wofi --show drun"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function () 
  hl.exec_cmd(terminal)
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user start hypridle")
  hl.exec_cmd("systemctl --user start hyprpaper")
  hl.exec_cmd("systemctl --user start ashell")
  hl.exec_cmd("dunst")
  hl.exec_cmd("/opt/Signal/signal-desktop")
  -- https://wiki.hyprland.org/Useful-Utilities/Must-have/#authentication-agent
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  -- hl.exec_cmd("/usr/libexec/hyprpolkitagent")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme BreezeX-RosePine-Linux")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 192")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface enable-animations false")
  hl.exec_cmd("/usr/bin/gio launch ~/.local/share/applications/bitwarden.desktop")
  -- hl.exec_cmd("waybar & hyprpaper & firefox")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- NOTE: vaxry said env does the same as envd now. Ref:
-- https://matrix.to/#/!XSrhraBcyvvilXgctW:matrix.vaxry.net/$MHludxlWaS2oa1FoM7UHJ5NDlJRgyykLJMjkNlHuY1I?via=matrix.vaxry.net&via=matrix.org&via=tchncs.de

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- GTK_THEME
-- XCURSOR_THEME
-- hl.env("XCURSOR_SIZE, "96")
-- hl.env("HYPRCURSOR_SIZE, "96")
-- hl.env("HYPRCURSOR_SIZE, "96")
hl.env("XCURSOR_SIZE", "192")
hl.env("HYPRCURSOR_SIZE", "48")
hl.env("QT_CURSOR_SIZE", "48")
hl.env("HYPRCURSOR_THEME", "BreezeX-Dark-hyprcursor")
hl.env("XCURSOR_THEME", "BreezeX-Dark-hyprcursor")

-- -- https://wiki.archlinux.org/title/GTK#GTK_4_applications_are_slow
-- hl.env("GSK_RENDERER", "gl")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
-- hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("NVD_BACKEND", "direct")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- __GL_GSYNC_ALLOWED
-- __GL_VRR_ALLOWED
-- hl.env("AQ_NO_ATOMIC", "1")

-- Electron
-- https://wiki.archlinux.org/title/Wayland#Electron
-- https://www.electronjs.org/docs/latest/api/environment-variables#electron_ozone_platform_hint-linux
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.env("KITTY_ENABLE_WAYLAND", "1")

-- FreeCAD
-- It crashes w/o the COIN_GL_NO_CURRENT_CONTEXT_CHECK env var
hl.env("COIN_GL_NO_CURRENT_CONTEXT_CHECK", "1")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ua",
        -- kb_variant = "qwerty",
        kb_model   = "qwerty",
        kb_options = "grp:caps_toggle,compose:ralt",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

hl.unbind(mainMod .. " + C")  -- 󰍬 == <LEFT_Meta/SUPER>+C
local closeWindowBind = hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())  -- 󰍬 == <LEFT_Meta/SUPER>+C
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Keyboard backlight
hl.bind("XF86KbdBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set +33%"))
hl.bind("XF86KbdBrightnessDown",  hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set 33%-"))

-- Hyprshot Screenshots
-- Ref: https://wiki.gentoo.org/wiki/Hyprland#Screenshotting
--
-- FIXME: Install hyprpicker and add `-z` for screen freeze
-- Ref: https://itsfoss.com/taking-screenshots-hyprland/#did-you-know-you-can-also-freeze-the-screen
hl.bind(mainMod .. " + PRINT",  hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))  -- monitor
hl.bind(mainMod .. " + SHIFT + PRINT",  hl.dsp.exec_cmd("hyprshot -m window"))


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

----------
--- wk ---
----------

hl.plugin.load("/usr/lib/hyprland-plugins/dynamic-cursors.so")
if hl.plugin.dynamic_cursors ~= nil then
    hl.config({
        plugin = {
            dynamic_cursors = {

                -- enables the plugin
                enabled = true,


                -- configure shake to find
                -- magnifies the cursor if its is being shaken
                shake = {

                    -- enables shake to find
                    enabled = true,

                    -- controls how soon a shake is detected
                    -- lower values mean sooner
                    threshold = 3.0
                },

                -- use hyprcursor to get a higher resolution texture when the cursor is magnified
                -- see the `hyprcursor` section below
                hyprcursor = {
                    
                    -- use nearest-neighbour (pixelated) scaling when magnifying beyond texture size
                    -- this will also have effect without hyprcursor support being enabled
                    -- 0 - never use pixelated scaling
                    -- 1 - use pixelated when no highres image
                    -- 2 - always use pixelated scaling
                    nearest = 1,

                    -- enable dedicated hyprcursor support
                    enabled = true,
                },
            },
        },
    })
end

hl.config({
    render = {
        -- direct_scanout = 1,
    },
})
