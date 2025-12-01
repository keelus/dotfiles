{pkgs, ...}: let
	wallpaperImage =
		pkgs.fetchurl {
			url = "https://i.imgur.com/IZ82bTR.jpeg";
			sha256 = "1wvwy00gmw90kr1xqp1rljkdxsmcrwk1vvysjqqyz0gdc2plv9ay";
		};
in {
	services.hyprpaper = {
		enable = true;
		settings = {
			preload = ["${wallpaperImage}"];
			wallpaper = [
				"DP-1,${wallpaperImage}"
				"DP-2,${wallpaperImage}"
				"eDP-1,${wallpaperImage}"
			];
		};
	};
}
