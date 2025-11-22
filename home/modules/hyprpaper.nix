{pkgs, ...}: let
	wallpaperImage =
		pkgs.fetchurl {
			url = "https://i.imgur.com/IOomGtu.jpeg";
			sha256 = "0s2qn4kmxyiwlk91sncavzprikpb09mygrr3pxddday76qm85lij";
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
