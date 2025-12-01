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
		vscode-langservers-extracted

		basedpyright

		go
		gopls
		python314
		nodejs_24
		bun

		lua-language-server

		gcc
		libgcc
		gnumake
		cmake
		clang-tools
		libcxx
		valgrind
		bear

		SDL2

		docker_28

		jetbrains.idea-ultimate
		android-studio

		dbeaver-bin

		libreoffice-fresh
		hunspell
		hunspellDicts.en_US
		hunspellDicts.es_ES

		arduino-ide

		fd
		ripgrep
		zip
		unzip
		screen
		btop

		prismlauncher

		alejandra
		nixd

		stylua

		file
		parted
		wget

		vlc

		qt6.qt5compat
		qt6.qtsvg
		qt6.qtimageformats
		qt6.qtmultimedia
		qt6.qtdeclarative
		quickshell
	];
}
