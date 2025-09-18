{machine, ...}: {
	services.dunst = {
		enable = true;

		settings = {
			global = {
				monitor =
					if machine == "PC"
					then "DP-1"
					else "e-DP1";

				follow = "none";
				origin = "top-center";
				font = "Berkeley Mono 14";
				width = "(0, 600)";
				min_icon_size = 64;
				max_icon_size = 64;
				gap_size = 16;
				offset = "(0, 20)";
			};

			discord = {
				appname = "discord";
				frame_color = "#7289da";
				background = "#424549";
				foreground = "#ffffff";
			};
		};
	};
}
