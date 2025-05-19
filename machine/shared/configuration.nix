{ config, pkgs, inputs, machine, ... }:
let pkgsUnstable = import inputs.nixpkgs {
	system  = "x86_64-linux";
	config.allowUnfree = true;
};
in
{
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
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

		vulkan-tools
		vulkan-loader

		(pkgsUnstable.ciscoPacketTracer8.override {
			packetTracerSource = /home/keelus/Documents/CiscoPacketTracer822_amd64_signed.deb;
		})
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



	system.stateVersion = "24.11";

	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	networking.networkmanager.enable = true;

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
