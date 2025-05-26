{ pkgs, inputs, ... }: {
	home.packages = with pkgs; [
		bat
		git
		gh

		waybar

		pavucontrol
		nemo

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
		gnumake
		cmake

		docker_28

		jetbrains.idea-ultimate
		android-studio

		dbeaver-bin
		ciscoPacketTracer8

		libsForQt5.xdg-desktop-portal-kde
		libreoffice-fresh

		arduino-ide

		fd
		ripgrep
	];
}
