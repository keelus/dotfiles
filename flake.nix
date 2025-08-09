{
	description = "keelus NixOS configuration";

	inputs = {
		nixpkgs = {
			type = "github";
			owner = "NixOS";
			repo = "nixpkgs";
			ref = "nixos-unstable";
		};

		sops-nix = {
			type = "github";
			owner = "Mic92";
			repo = "sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			type = "github";
			owner = "nix-community";
			repo = "home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {
		nixpkgs,
		home-manager,
		...
	} @ inputs: {
		nixosConfigurations = {
			pc =
				nixpkgs.lib.nixosSystem {
					system = "x86_64-linux";
					specialArgs = {
						inherit inputs;
						machine = "pc";
					};
					modules = [
						./machine/shared/default.nix
						./machine/pc/default.nix
						./home-configuration.nix
						home-manager.nixosModules.home-manager
						{
							home-manager.extraSpecialArgs = {
								machine = "pc";
							};
						}
					];
				};

			laptop =
				nixpkgs.lib.nixosSystem {
					system = "x86_64-linux";
					specialArgs = {
						inherit inputs;
						machine = "laptop";
					};
					modules = [
						./machine/shared/default.nix
						./machine/laptop/default.nix
						./home-configuration.nix
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
