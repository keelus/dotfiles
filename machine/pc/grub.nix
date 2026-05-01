{...}: {
	boot.loader.grub = {
		extraEntries = ''
			menuentry "Windows" {
				insmod part_gpt
				insmod fat
				search --no-floppy --fs-uuid --set=root 1032-F454
				chainloader /EFI/Microsoft/Boot/bootmgfw.efi
			}
		'';
		gfxmodeEfi = "2560x1440";
		enableCryptodisk = true;
	};
}
