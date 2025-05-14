# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# This is a test.

{ config, pkgs, inputs, machine, ... }:
{
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	imports =
		[
			./home-configuration.nix
			inputs.sops-nix.nixosModules.sops
		];

	# Bootloader.
	boot.loader.systemd-boot.enable = false;
	boot.loader.efi.canTouchEfiVariables = true;
	hardware.enableAllFirmware = true;
	boot.kernelPackages = pkgs.linuxPackages_latest;
	boot.loader.grub = {
		enable = true;
		version = 2;
		efiSupport = true;
		devices = [ "nodev" ];
	};

	networking.hostName = "nixos"; # Define your hostname.

	# Set your time zone.
	time.timeZone = "Europe/Madrid";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "es_ES.UTF-8";
		LC_IDENTIFICATION = "es_ES.UTF-8";
		LC_MEASUREMENT = "es_ES.UTF-8";
		LC_MONETARY = "es_ES.UTF-8";
		LC_NAME = "es_ES.UTF-8";
		LC_NUMERIC = "es_ES.UTF-8";
		LC_PAPER = "es_ES.UTF-8";
		LC_TELEPHONE = "es_ES.UTF-8";
		LC_TIME = "es_ES.UTF-8";
	};

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.keelus = {
		isNormalUser = true;
		description = "keelus";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	programs.hyprland.enable = true;
	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		vim
		hyprpaper
		sops

		vulkan-tools
		vulkan-loader
	];

	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
				user = "keelus";
			};
		};
	};



	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.11"; # Did you read the comment?

	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	# hardware.graphics = {
	# 	enable = true;
	# 	enable32Bit = true;
	# };
	# boot.kernelModules = ["amdgpu"];
	# 125000services.xserver.videoDrivers = [ "amdgpu" ];

	# hardware.opengl = {
	# 	enable = true;
	# 	extraPackages = with pkgs; [
	# 		vpl-gpu-rt
	# 	];
	# };

	hardware = {
		opengl.enable = true;
		opengl.driSupport32Bit = true;

		opengl.extraPackages = with pkgs; [
			intel-media-driver
			vaapiVdpau
			libvdpau-va-gl
		];
	};

	sops = {
		defaultSopsFile = ./secrets/secrets.yaml;
		defaultSopsFormat = "yaml";

		age.keyFile = "/home/keelus/.config/sops/age/keys.txt";

		secrets = {
			"wifi/home/ssid" = { };
			"wifi/home/psk" = { };
			"wifi/phone/ssid" = { };
			"wifi/phone/psk" = { };
			"wifi/uni/ssid" = { };
			"wifi/uni/psk" = { };
			"wifi/uni/mail" = { };
		};
	};

	networking.networkmanager = {
		enable = true;

		ensureProfiles = if machine == "laptop" then {
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

				Eduroam = {
					connection = {
						id = "Eduroam";
						type = "wifi";
					};

					wifi = {
						ssid = "$UNI_SSID";
					};

					wifi-security = {
						auth-alg = "open";
						key-mgmt = "wpa-eap";
					};

					"802-1x" = {
						anonymous-identity="anonymous.cat.20170711@opendeusto.es";
						eap = "peap";
						ca-cert="/home/keelus/Desktop/ca.pem";
						identity="$UNI_MAIL";
						password="$UNI_PSK";
						phase2-auth="mschapv2";
					};

					ipv4 = {
						method = "auto";
					};
					ipv6 = {
						method = "auto";
					};
				};
			};
		} else {};
	};

	services.mysql = {
		enable = true;
		package = pkgs.mariadb;
	};

	networking.firewall.allowedTCPPorts = [ 22 ];
	services.openssh = {
		enable = true;
		ports = [ 22 ];
		settings = {
			PasswordAuthentication = true;
			AllowUsers = [ "keelus" ];
		};
	};
}
