{machine, ...}: let
	configFile =
		if machine == "laptop"
		then ./waybar/config_laptop.jsonc
		else ./waybar/config_pc.jsonc;
in {
	home.file.".config/waybar/config.jsonc".source = configFile;
	home.file.".config/waybar/colors.css".source = ./waybar/colors.css;
	home.file.".config/waybar/style.css".source = ./waybar/style.css;
	home.file.".config/waybar/power_menu.xml".source = ./waybar/power_menu.xml;
}
