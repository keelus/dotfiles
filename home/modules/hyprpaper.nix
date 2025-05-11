{ config, pkgs, ... }:
let
	wallpaperImage = pkgs.fetchurl {
		url = "https://images.unsplash.com/photo-1510877275-cf9a89103efe?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&dl=osman-rana-u6XKiFvtpQ0-unsplash.jpg";
		sha256 = "1bwkmb2lyj24ap38f3zhnqaqngga1hgsnc62ncgx4mvi8pxx7j5l";
	};
in
{
	services.hyprpaper = {
		enable = true;
		settings = {
			preload = [ "${wallpaperImage}" ];
			wallpaper = [ 
				"DP-1,${wallpaperImage}"
				"DP-2,${wallpaperImage}"
				"eDP-1,${wallpaperImage}"
			];
		};
	};
}
