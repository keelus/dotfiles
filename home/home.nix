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
			nrs-pc = "sudo nixos-rebuild switch --flake ~/.nix#pc";
			nrs-laptop = "sudo nixos-rebuild switch --flake ~/.nix#laptop";
		};
		initExtra = ''
			eval "$(direnv hook bash)"
			PS1='\[\e[1m\][\u@\h\[\e[0m\] at \[\e[3m\]\w\[\e[0;1m\]]\\$\[\e[0m\] '
			export TERM=xterm-256color
			alias vi='nvim'
			alias vim='nvim'
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
