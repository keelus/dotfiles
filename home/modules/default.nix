{ pkgs, ... }:
{
	imports = [
		./ghostty.nix
		./neovim.nix
		./waybar.nix
		./gtk.nix
		./hyprland.nix
		./hyprpaper.nix
	];
}
