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
	boot.initrd.kernelModules = ["usb_storage"];
	boot.kernelModules = ["kvm-amd"];
	boot.extraModulePackages = [];

	boot.initrd.luks.devices = {
		crypted = {
			device = "/dev/disk/by-uuid/bf64b2fc-7624-410c-a5a6-207bd2c724da";
			preLVM = true;
		};
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/1032-F454";
		fsType = "vfat";
		options = ["fmask=0022" "dmask=0022"];
	};

	fileSystems."/" = {
		device = "/dev/mapper/vg-nixos";
		fsType = "ext4";
	};

	swapDevices = [
		{device = "/dev/mapper/vg-swap";}
	];

	networking.useDHCP = lib.mkDefault true;
	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
