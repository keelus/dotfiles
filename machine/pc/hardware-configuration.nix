{
	config,
	lib,
	modulesPath,
	...
}: {
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "sd_mod"];
	boot.initrd.kernelModules = [];
	boot.kernelModules = ["kvm-amd" "vboxdrv" "vboxnetadp" "vboxnetflt"];
	boot.extraModulePackages = [];

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/527cfca7-00ea-44d3-b9c6-efeb0d2fdf21";
		fsType = "ext4";
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/EA6F-085C";
		fsType = "vfat";
		options = ["fmask=0022" "dmask=0022"];
	};

	swapDevices = [
		{device = "/dev/disk/by-uuid/9877fc6f-5adb-4cc8-bbbf-6ebc3a3b3f0a";}
	];

	networking.useDHCP = lib.mkDefault true;
	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
