{pkgs, ...}: {
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};
	boot.kernelModules = ["amdgpu"];
	services.xserver.videoDrivers = ["amdgpu"];

	hardware.opengl = {
		enable = true;
		extraPackages = with pkgs; [
			vpl-gpu-rt
		];
	};
}
