{ config, pkgs, ... }: {
	programs.fuzzel = {
		enable = true;
		settings = {
			colors.background = "FFFFFFFF";
		};
	};
}
