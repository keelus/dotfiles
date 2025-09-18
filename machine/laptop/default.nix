{...}: {
	imports = [
		./hardware-configuration.nix
		./gpu.nix
		./configuration.nix
		./grub.nix
	];
}
