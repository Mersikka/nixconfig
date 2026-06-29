{
  pkgs-unstable,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;

    # Important: migrate from hyprland.conf to hyprland.lua
    configType = "lua";

    package = pkgs-unstable.hyprland;
    portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;

    xwayland.enable = true;
    systemd.enable = true;

    # Do not keep the old hyprlang settings block during the first migration.
    settings = { };

    extraConfig = ''
      ----------------
      -- Programs
      ----------------
      local terminal = "kitty"
      local fileManager = "dolphin"
      local menu = "vicinae open"
      local mainMod = "SUPER"
      local browser = "helium"

      ----------------
      -- Autostart
      ----------------
      hl.on("hyprland.start", function()
        hl.exec_cmd("vicinae server")
        hl.exec_cmd("waybar")
      end)

      ----------------
      -- Monitors
      ----------------
      hl.monitor({
        output = "",
        mode = "preferred",
        position = "auto",
        scale = "auto",
      })

      ----------------
      -- Environment
      ----------------
      hl.env("XCURSOR_SIZE", "24")
      hl.env("HYPRCURSOR_SIZE", "24")
      hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")

      ----------------
      -- Look and feel
      ----------------
      hl.config({
        general = {
          gaps_in = 0,
          gaps_out = 0,
          border_size = 1,

          col = {
            active_border = "rgba(cba6f7ee)",
            inactive_border = "rgba(595959aa)",
          },

          resize_on_border = false,
          allow_tearing = false,
          layout = "dwindle",
        },

        decoration = {
          rounding = 0,
          rounding_power = 0,

          active_opacity = 1.0,
          inactive_opacity = 1.0,

          shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
          },

          blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
          },
        },

        animations = {
          enabled = true,

          bezier = {
            "easeOutQuint,0.23,1,0.32,1",
            "easeInOutCubic,0.65,0.05,0.36,1",
            "linear,0,0,1,1",
            "almostLinear,0.5,0.5,0.75,1",
            "quick,0.15,0,0.1,1",
          },

          animation = {
            "global,1,10,default",
            "border,1,5.39,easeOutQuint",
            "windows,1,4.79,easeOutQuint",
            "windowsIn,1,4.1,easeOutQuint,popin 87%",
            "windowsOut,1,1.49,linear,popin 87%",
            "fadeIn,1,1.73,almostLinear",
            "fadeOut,1,1.46,almostLinear",
            "fade,1,3.03,quick",
            "layers,1,3.81,easeOutQuint",
            "layersIn,1,4,easeOutQuint,fade",
            "layersOut,1,1.5,linear,fade",
            "fadeLayersIn,1,1.79,almostLinear",
            "fadeLayersOut,1,1.39,almostLinear",
            "workspaces,1,1.94,almostLinear,fade",
            "workspacesIn,1,1.21,almostLinear,fade",
            "workspacesOut,1,1.94,almostLinear,fade",
            "zoomFactor,1,7,quick",
          },
        },

        dwindle = {
          preserve_split = true,
        },

        master = {
          new_status = "master",
        },

        misc = {
          force_default_wallpaper = -1,
          disable_hyprland_logo = false,
        },

        input = {
          kb_layout = "eu",
          follow_mouse = 1,
          sensitivity = 0,

          touchpad = {
            natural_scroll = true,
          },
        },
      })

      ----------------
      -- Gestures
      ----------------
      hl.gesture({
        fingers = 3,
        direction = "horizontal",
        action = "workspace",
      })

      ----------------
      -- Per-device config
      ----------------
      hl.device({
        name = "epic-mouse-v1",
        sensitivity = -0.5,
      })

      ----------------
      -- Keybinds
      ----------------
      hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
      hl.bind(mainMod .. " + Q", hl.dsp.window.close())
      hl.bind(mainMod .. " + M", hl.dsp.exit())
      hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
      hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
      hl.bind(mainMod .. " + V", hl.dsp.window.float())
      hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

      -- Kept via hyprctl because pseudo is layout-specific.
      hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprctl dispatch pseudo"))

      hl.bind("ALT + RETURN", hl.dsp.window.fullscreen())
      hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

      hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
      hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
      hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
      hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

      -- Special workspace: safe compatibility path.
      hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace magic"))
      hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special:magic"))

      hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
      hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

      -- Workspaces 1–9, matching your original builtins.genList 9.
      for i = 1, 9 do
        local ws = tostring(i)
        hl.bind(mainMod .. " + " .. ws, hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + SHIFT + " .. ws, hl.dsp.window.move({ workspace = i, follow = true }))
      end

      ----------------
      -- Mouse binds
      ----------------
      hl.bind(
        mainMod .. " + mouse:272",
        hl.dsp.exec_cmd("hyprctl dispatch movewindow"),
        { mouse = true }
      )
      hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

      ----------------
      -- Media / brightness binds
      ----------------
      hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {
        locked = true,
        repeating = true,
      })

      hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
        locked = true,
        repeating = true,
      })

      hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
        locked = true,
        repeating = true,
      })

      hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {
        locked = true,
        repeating = true,
      })

      hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), {
        locked = true,
        repeating = true,
      })

      hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), {
        locked = true,
        repeating = true,
      })

      hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
      hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
      hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
      hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
    '';
  };
}
