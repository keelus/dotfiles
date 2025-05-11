{
	description = "keelus NixOS configuration";

	inputs = {
		nixpkgs = {
			type = "github";
			owner = "NixOS";
			repo = "nixpkgs";
			ref = "nixos-unstable";
		};

		home-manager = {
			type = "github";
			owner = "nix-community";
			repo = "home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }:
		{
			nixosConfigurations = {
				pc = nixpkgs.lib.nixosSystem {
					system = "x86_64-linux";
					modules = [
						./configuration.nix
						home-manager.nixosModules.home-manager
						{
							home-manager.extraSpecialArgs = {
								machine = "pc";
							};
						}
					];
				};

				laptop = nixpkgs.lib.nixosSystem {
					system = "x86_64-linux";
					modules = [
						./configuration.nix
						home-manager.nixosModules.home-manager
						{
							home-manager.extraSpecialArgs = {
								machine = "laptop";
							};
						}
					];
				};
			};
		};
}
