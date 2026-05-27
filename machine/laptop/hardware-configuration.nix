{
	config,
	lib,
	modulesPath,
	...
}: {
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod"];
	boot.initrd.kernelModules = ["dm-snapshot"];
	boot.kernelModules = ["kvm-intel"]; # "vboxdrv" "vboxnetadp" "vboxnetflt"];
	boot.extraModulePackages = [];

	boot.initrd.luks.devices.cryptroot = {
		name = "cryptroot";
		device = "/dev/disk/by-uuid/348d12f6-f583-462b-b687-dd9246093558";
		preLVM = true;
		allowDiscards = true;
	};

	fileSystems."/" = {
		device = "/dev/mapper/vg-nixos";
		fsType = "ext4";
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/9FDD-0EC7";
		fsType = "vfat";
		options = ["fmask=0077" "dmask=0077"];
	};

	swapDevices = [
		{device = "/dev/mapper/vg-swap";}
	];

	networking.useDHCP = lib.mkDefault true;
	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
