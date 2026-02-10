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
			splash = false;
			preload = ["${wallpaperImage}"];
			wallpaper = [
				{
					monitor = "DP-1";
					path = "${wallpaperImage}";
				}
				{
					monitor = "DP-2";
					path = "${wallpaperImage}";
				}
				{
					monitor = "eDP-1";
					path = "${wallpaperImage}";
				}
			];
		};
	};
}
