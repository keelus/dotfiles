# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# This is a test.

{ config, pkgs, ... }:
{
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
			./home-configuration.nix
		];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	hardware.enableAllFirmware = true;
	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	# networking.networkmanager.enable = true;
	#networking.wireless = {
	#  enable = true;
	#  networks."Hugo's iPhone".psk = "hugopass";
	#  extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
	#};
	networking.networkmanager.enable = true;

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

	programs.firefox.enable = true;
	programs.hyprland = {
		enable = true;
	};

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		vim
		hyprpaper

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

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

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

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};
	boot.kernelModules = ["amdgpu"];
	services.xserver.videoDrivers = [ "amdgpu" ];

}
