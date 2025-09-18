{
	config,
	pkgs,
	inputs,
	...
}: {
	nix.settings.experimental-features = ["nix-command" "flakes"];
	imports = [
		inputs.sops-nix.nixosModules.sops
	];

	environment.systemPackages = with pkgs; [
		sops
	];

	sops = {
		defaultSopsFile = ./secrets.yaml;
		defaultSopsFormat = "yaml";

		age.keyFile = "/home/keelus/.config/sops/age/keys.txt";

		secrets = {
			"wifi/home/ssid" = {};
			"wifi/home/psk" = {};
			"wifi/phone/ssid" = {};
			"wifi/phone/psk" = {};
			"wifi/uni/ssid" = {};
			"wifi/uni/psk" = {};
			"wifi/uni/mail" = {};
		};
	};

	networking.networkmanager = {
		ensureProfiles = {
			environmentFiles = [
				config.sops.secrets."wifi/home/ssid".path
				config.sops.secrets."wifi/home/psk".path
				config.sops.secrets."wifi/phone/ssid".path
				config.sops.secrets."wifi/phone/psk".path
				config.sops.secrets."wifi/uni/ssid".path
				config.sops.secrets."wifi/uni/psk".path
				config.sops.secrets."wifi/uni/mail".path
			];

			profiles = {
				Phone = {
					connection = {
						id = "Phone";
						type = "wifi";
					};

					wifi = {
						ssid = "$PHONE_SSID";
					};

					wifi-security = {
						auth-alg = "open";
						key-mgmt = "wpa-psk";
						psk = "$PHONE_PSK";
					};

					ipv4 = {
						method = "auto";
					};
					ipv6 = {
						method = "auto";
					};
				};

				Home = {
					connection = {
						id = "Home";
						type = "wifi";
					};

					wifi = {
						ssid = "$HOME_SSID";
					};

					wifi-security = {
						auth-alg = "open";
						key-mgmt = "wpa-psk";
						psk = "$HOME_PSK";
					};

					ipv4 = {
						method = "auto";
					};
					ipv6 = {
						method = "auto";
					};
				};
			};
		};
		wifi.backend = "iwd";
	};
}
