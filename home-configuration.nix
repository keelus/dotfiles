{ config, pkgs, home-manager, ... }:
{
	home-manager = {
		useUserPackages = true;
		useGlobalPkgs = true;
		backupFileExtension = "backup";
		users.keelus = import ./home/home.nix;
	};
}
