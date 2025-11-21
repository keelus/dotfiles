{pkgs, ...}: {
	boot.loader.grub = {
		useOSProber = true;
		gfxmodeEfi = "2880x1800";
		device = "nodev";
		efiSupport = true;

		theme =
			pkgs.fetchFromGitHub {
				owner = "YouStones";
				repo = "ultrakill-grub-theme";
				rev = "main";
				sha256 = "0r7qw7a972f66a9rm61wrmzfm43m3xxbx5gp8ay57my7dvb2w11y";
			};
	};
}
