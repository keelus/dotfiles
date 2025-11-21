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
	boot.initrd.kernelModules = [ "dm-snapshot" ];
	boot.kernelModules = ["kvm-intel" "vboxdrv" "vboxnetadp" "vboxnetflt"];
	boot.extraModulePackages = [];

	boot.initrd.luks.devices.cryptroot = {
		name = "cryptroot";
		device = "/dev/disk/by-uuid/5527258f-a214-42fc-ac29-54bf72f603e5";
		preLVM = true;
		allowDiscards = true;
	};

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/72cfb86d-b9ce-4e11-977f-5810ddc89dba";
		fsType = "ext4";
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/51F5-F677";
		fsType = "vfat";
		options = ["fmask=0077" "dmask=0077"];
	};

	swapDevices = [
		{device = "/dev/disk/by-uuid/81c56301-5aad-47b2-9963-0c89174e12aa";}
	];

	networking.useDHCP = lib.mkDefault true;
	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
