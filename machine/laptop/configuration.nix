{
	config,
	pkgs,
	inputs,
	...
}: {
	nix.settings.experimental-features = ["nix-command" "flakes"];

	networking.networkmanager = {
		wifi.backend = "iwd";
	};
	systemd.tmpfiles.rules = [
		"C /var/lib/iwd/eduroam.8021x 0600 root root - /home/keelus/eduroam.8021x"
	];
}
