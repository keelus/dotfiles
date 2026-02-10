{machine, ...}: let
	monitorConfig =
		if machine == "pc"
		then ''
			monitor=DP-1, 2560x1440@180.00, 1920x0, 1
			monitor=DP-2, 1920x1080@143.85, 0x0, 1
		''
		else ''
			monitor=eDP-1, 2880x1800@90.00, 0x0, 1.5
		'';

	keyboardName =
		if machine == "pc"
		then "keychron-keychron-v10"
		else "at-translated-set-2-keyboard";
in {
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		settings = {
			exec-once = [
				"dunst & waybar & nm-applet"
				"exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
			];

			exec = [
				"exec = gsettings set org.gnome.desktop.interface gtk-theme \"Dracula-pink-accent\""
				"exec = gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\""
			];

			general = {
				gaps_in = 3;
				gaps_out = 5;

				border_size = 2;

				"col.active_border" = "rgba(c0caf5ff)";
				"col.inactive_border" = "rgba(c0caf57f)";

				resize_on_border = false;

				allow_tearing = false;

				layout = "dwindle";
			};

			decoration = {
				rounding = 5;

				active_opacity = 1.0;
				inactive_opacity = 0.95;

				shadow = {
					enabled = true;
					range = 3;
					render_power = 3;
					color = "rgba(1a1a1aee)";
				};

				blur = {
					enabled = true;
					size = 3;
					passes = 1;

					vibrancy = 0.1696;
				};
			};

			dwindle = {
				pseudotile = true;
				preserve_split = true;
				force_split = 2;
			};

			master.new_status = "master";

			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
			};

			input = {
				kb_layout = "us,es";
				kb_options = ["grp:alt_space_toggle"];

				follow_mouse = 1;

				sensitivity = 0;

				touchpad.natural_scroll = false;
			};

			device = {
				name = "epic-mouse-v1";
				sensitivity = -0.5;
			};

			bind = [
				"SUPER, return, exec, ghostty"
				"SUPER, Q, killactive,"
				"SUPER, M, exit,"
				"SUPER, E, exec, dolphin"
				"SUPER, V, togglefloating,"
				"SUPER, space, exec, fuzzel"
				"SUPER,F,fullscreen"

				", Print, exec, grim -g \"$(slurp -d)\" - | wl-copy"
				"SUPER, h, movefocus, l"
				"SUPER, l, movefocus, r"
				"SUPER, k, movefocus, u"
				"SUPER, j, movefocus, d"

				"SUPER shift, h, movewindow, l"
				"SUPER shift, l, movewindow, r"
				"SUPER shift, k, movewindow, u"
				"SUPER shift, j, movewindow, d"

				"SUPER, O, exec, hyprctl switchxkblayout ${keyboardName} 1"
				"SUPER, P, exec, hyprctl switchxkblayout ${keyboardName} 0"

				"SUPER, R, submap, resizing"

				"SUPER, 1, workspace, 1"
				"SUPER, 2, workspace, 2"
				"SUPER, 3, workspace, 3"
				"SUPER, 4, workspace, 4"
				"SUPER, 5, workspace, 5"
				"SUPER, 6, workspace, 6"
				"SUPER, 7, workspace, 7"
				"SUPER, 8, workspace, 8"
				"SUPER, 9, workspace, 9"
				"SUPER, 0, workspace, 10"

				"SUPER SHIFT, 1, movetoworkspace, 1"
				"SUPER SHIFT, 2, movetoworkspace, 2"
				"SUPER SHIFT, 3, movetoworkspace, 3"
				"SUPER SHIFT, 4, movetoworkspace, 4"
				"SUPER SHIFT, 5, movetoworkspace, 5"
				"SUPER SHIFT, 6, movetoworkspace, 6"
				"SUPER SHIFT, 7, movetoworkspace, 7"
				"SUPER SHIFT, 8, movetoworkspace, 8"
				"SUPER SHIFT, 9, movetoworkspace, 9"
				"SUPER SHIFT, 0, movetoworkspace, 10"

				"SUPER, S, togglespecialworkspace, magic"
				"SUPER SHIFT, S, movetoworkspace, special:magic"

				"SUPER, mouse_down, workspace, e+1"
				"SUPER, mouse_up, workspace, e-1"
			];

			bindm = [
				"SUPER, mouse:272, movewindow"
				"SUPER, mouse:273, resizewindow"
			];

			bindl = [
				",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPause, exec, playerctl play-pause"
				", XF86AudioPlay, exec, playerctl play-pause"
				", XF86AudioPrev, exec, playerctl previous"
			];

			bindel = [
				",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
				",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
			];

			env = [
				"XCURSOR_SIZE,24"
				"HYPRCURSOR_SIZE,24"
				"QT_QPA_PLATFORMTHEME,qt6ct"
			];

			animations = {
				enabled = false;
				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];
				animation = [
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, slide"
					"workspacesOut, 1, 1.94, almostLinear, slide"
				];
			};
		};

		extraConfig = ''
			${monitorConfig}

			submap = resizing
			binde = , l, resizeactive, 30 0
			binde = , h, resizeactive, -30 0
			binde = , k, resizeactive, 0 -30
			binde = , j, resizeactive, 0 30
			bind = , escape, submap, reset
			submap = reset

			blurls = waybar
			layerrule {
				name = layerrule-1
				blur = on
				match:namespace = waybar
			}

			windowrule {
				name = windowrule-1
				float = on
				match:title = ^Open Files$
				match:class = xdg-desktop-portal-gtk
			}

			windowrule {
				name = windowrule-2
				suppress_event = maximize
				match:class = .*
			}

			windowrule {
				name = windowrule-3
				no_focus = on
				match:class = ^$
				match:title = ^$
				match:xwayland = 1
				match:float = 1
				match:fullscreen = 0
				match:pin = 0
			}
		'';
	};
}
