{ pkgs, ... }:
{
	imports = [
		./ghostty.nix
		./neovim.nix
		./waybar.nix
		./gtk.nix
		./hyprland.nix
		./hyprpaper.nix
		./fuzzel.nix
		./r.nix
		./dunst.nix
	];
}
