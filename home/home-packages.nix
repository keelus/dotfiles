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

		cargo
		rustc
		rustfmt
		rust-analyzer
		clippy

		go
		python311
		nodejs_24
		libgcc
		bun
		gcc

		jetbrains.idea-ultimate

		fd
		ripgrep
	];
}
