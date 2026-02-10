{pkgs, ...}: {
	home.packages = with pkgs; [
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

		libreoffice-fresh
		hunspell
		hunspellDicts.en_US
		hunspellDicts.es_ES

		fd
		ripgrep
		zip
		unzip
		screen
		btop
		bat
		file
		parted
		wget

		vlc

		docker_28

		gcc
		libgcc
		gnumake
		cmake
		clang-tools
		libcxx
		gdb
		valgrind
		bear

		cargo
		rustc
		rustfmt
		rust-analyzer
		clippy

		python314
		basedpyright

		go
		gopls

		nodejs_24
		bun
		typescript-language-server
		vscode-langservers-extracted

		alejandra
		nixd
		lua-language-server
		stylua

		SDL2
	];
}
