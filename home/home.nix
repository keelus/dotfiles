{ config, pkgs, ...}: {
	imports = [
		./modules
		./home-packages.nix
	];

	home.username = "keelus";
	home.homeDirectory = "/home/keelus";
	home.stateVersion = "24.11";

	programs.bash = {
		enable = true;
		shellAliases = {
			nrs-pc = "sudo nixos-rebuild switch --flake ~/.nix#pc";
			nrs-laptop = "sudo nixos-rebuild switch --flake ~/.nix#laptop";
		};
		initExtra = ''
			PS1='\[\e[1m\][\u@\h\[\e[0m\] at \[\e[3m\]\w\[\e[0;1m\]]\\$\[\e[0m\] '
		'';
	};

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};
}
