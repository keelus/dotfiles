{pkgs, ...}: {
	imports = [
		./modules
		./home-packages.nix
	];

	home.username = "keelus";
	home.homeDirectory = "/home/keelus";
	home.stateVersion = "24.11";

	home.pointerCursor = {
		name = "Bibata-Original-Classic";
		package = pkgs.bibata-cursors;
		size = 24;
		gtk.enable = true;
		x11.enable = true;
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			nrs-pc = "sudo nixos-rebuild switch --flake ~/.nix#pc --impure";
			nrs-laptop = "sudo nixos-rebuild switch --flake ~/.nix#laptop --impure";
			vi = "nvim";
			vim = "nvim";
			neofetch = "neofetch --ascii_colors 3 --colors 3 3 3 3";
		};
		initExtra = ''
			eval "$(direnv hook bash)"
			PS1='\[\e[1m\][\u@\h\[\e[0m\] at \[\e[3m\]\w\[\e[0;1m\]]\\$\[\e[0m\] '
			export TERM=xterm-256color
		'';
	};

	home.sessionVariables = {
		NIXOS_OZONE_WL = "1";
	};

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};
}
