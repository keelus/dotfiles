{pkgs, ...}: {
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

		typescript-language-server

		basedpyright

		go
		python311
		nodejs_24
		bun

		lua-language-server

		gcc
		libgcc
		gnumake
		cmake
		clang-tools
		libcxx

		SDL2

		docker_28

		jetbrains.idea-ultimate
		android-studio

		dbeaver-bin

		libsForQt5.xdg-desktop-portal-kde
		libreoffice-fresh

		arduino-ide

		fd
		ripgrep
		zip
		unzip
		screen
		btop

		alejandra
		nixd

		stylua
	];
}
