{pkgs, ...}: {
	hardware = {
		opengl.enable = true;
		opengl.driSupport32Bit = true;

		opengl.extraPackages = with pkgs; [
			intel-media-driver
			vaapiVdpau
			libvdpau-va-gl
		];
	};
}
