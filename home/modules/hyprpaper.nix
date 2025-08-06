{pkgs, ...}: let
	wallpaperImage =
		pkgs.fetchurl {
			url = "https://i.imgur.com/4D0MSU0.jpeg";
			sha256 = "1q681vvy0asvvi7p3r8q4cjl0sxna5hb7g0jsh1pjfbpm35dgwri";
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
