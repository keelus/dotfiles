{...}: {
	programs.ghostty = {
		enable = true;

		settings = {
			window-decoration = false;
			font-family = "TX02 Nerd Font Mono";
			font-style = "Bold";
			theme = "TokyoNight Night";
			font-size = "14";
			window-padding-x = "3";
			window-padding-y = "3";
			confirm-close-surface = false;
			background-opacity = 0.95;
		};
	};
}
