{
	config,
	lib,
	modulesPath,
	...
}: {
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "nvme"];
	boot.initrd.kernelModules = [];
	boot.kernelModules = ["kvm-intel" "vboxdrv" "vboxnetadp" "vboxnetflt"];
	boot.extraModulePackages = [];

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/75822cc7-da97-4764-8e91-80946fb78e3c";
		fsType = "ext4";
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/9E34-0033";
		fsType = "vfat";
		options = ["fmask=0077" "dmask=0077"];
	};

	swapDevices = [
		{device = "/dev/disk/by-uuid/fc6f80af-a9d6-494c-a944-c618c5cdfd51";}
	];

	networking.useDHCP = lib.mkDefault true;
	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
