{ pkgs, ... }:
{
	imports = [
		./ghostty.nix
		./neovim.nix
		./waybar.nix
		./gtk.nix
		./hyprpaper.nix
	];
}
