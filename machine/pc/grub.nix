{...}: {
	boot.loader.grub = {
		extraEntries = ''
			menuentry "Windows" {
				insmod part_gpt
				insmod fat
				search --no-floppy --fs-uuid --set=root D401-3027
				chainloader /EFI/Microsoft/Boot/bootmgfw.efi
			}
		'';
		gfxmodeEfi = "2560x1440";
		enableCryptodisk = true;
	};
}
