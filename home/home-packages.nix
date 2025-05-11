{ pkgs, inputs, ... }: {
	home.packages = with pkgs; [
		bat
		git
		gh

		waybar
		fuzzel

		pavucontrol

		discord

		inotify-tools
		neofetch

		grim
		slurp
		wl-clipboard
	];
}
