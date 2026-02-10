{pkgs, ...}: {
	boot.loader.grub = {
		useOSProber = true;
		gfxmodeEfi = "2880x1800";
		device = "nodev";
		efiSupport = true;
		timeout = 1;
	};
}
