{ pkgs, inputs, ... }: {
	home.packages = with pkgs; [
		bat
		git
		gh

		waybar

		pavucontrol

		discord
		firefox
		obsidian
		spotify

		inotify-tools
		neofetch

		grim
		slurp
		wl-clipboard

		playerctl
		brightnessctl

		networkmanagerapplet

		python311
		nodejs_24
		libgcc

		fd
	];
}
